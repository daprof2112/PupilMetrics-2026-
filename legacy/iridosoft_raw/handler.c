#include <windows.h>
#include<stdio.h>
#pragma comment(lib, "user32")
#pragma comment(lib, "gdi32")
#pragma comment(lib, "kernel32")
#pragma comment(lib, "Comdlg32")
#include <Vfw.h>
#pragma comment(lib, "Vfw32")

#pragma data_seg(".shared")
LONG OldWndProc=0;
HWND hwndd;
int fnd=0;
char buff[1024]={0};
char b1[30]={0};
int b=0;
int r=1;
long m=0;
long cnt=0;
int ve=0;
FILE *log;
HWND crap;
HWND crap1;
HWND camera=NULL;
typedef struct _info{
 HWND hwnd;
 long wndProc;
 struct _info *nxt;
}info;
info *cProc;
info *sProc;
HMENU hMenu1;
int flag=1;
int be=1;
#define IDM_FILE_NEW 5001
#define IDM_FILE_OPEN 5002
#define IDM_FILE_QUIT 5003
#pragma data_seg()
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lParam);
BOOL CALLBACK EnumChildProc(HWND hwnd,LPARAM lParam);
void __declspec(dllexport) Blah();
void AddMenus(HWND);
char *name="Button";
char *wndClass="Shell_TrayWnd";
char *shool="AfxFrameOrView42s";
char *fpath="imagee.bmp";
RECT rcc;
HDC hdc;
HWND harr[10]={0};
HWND harr1[4]={0};
OPENFILENAME ofn;
    char szFileName[MAX_PATH] = "";


LRESULT CALLBACK WndProc( HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam )
{
long lStyle;
  static char *lyrics =  "Note:\nMultiple clicks on Start button are required before preview becomes active.\
                          \n\nAfter connecting camera you may choose resolution by clicking on Format button.";
    
  switch(msg)  
  {
	case WM_CREATE:
	{

	    crap1=CreateWindow(TEXT("STATIC"), lyrics, 
		    WS_CHILD | WS_VISIBLE | SS_LEFT|WS_BORDER,
		    40, 20, 320, 240,
		    hwnd, (HMENU) 1, NULL, NULL);
 CreateWindow(TEXT("button"), TEXT("Start"),WS_VISIBLE | WS_CHILD ,
		             60, 270, 80, 25,        
		             hwnd, (HMENU) 2, NULL, NULL);    

	    CreateWindow(TEXT("button"), TEXT("Click"),    
		             WS_VISIBLE | WS_CHILD ,
		             160, 270, 80, 25,        
		             hwnd, (HMENU) 3, NULL, NULL);
		    CreateWindow(TEXT("button"), TEXT("Format"),    
		             WS_VISIBLE | WS_CHILD ,
		             260, 270, 80, 25,        
		             hwnd, (HMENU) 4, NULL, NULL);
		EnableWindow(hwndd, FALSE);
	    return 0;
	}
    case WM_COMMAND:
	    if (LOWORD(wParam) == 2) {
		camera=capCreateCaptureWindow("Camera Irido", WS_VISIBLE + WS_CHILD, 0,0,320,240,crap1,0);
	     if(camera==NULL)
		 {
		   MessageBox(crap, "Camera open error", TEXT("Error"), MB_OK);
		 }
		 else
		 {
           SendMessage(camera, WM_CAP_DRIVER_CONNECT, 0, 0);
           SendMessage(camera, WM_CAP_SET_SCALE, TRUE, 0);
		   SendMessage(camera, WM_CAP_SET_PREVIEWRATE, 50, 0);
           SendMessage(camera, WM_CAP_SET_PREVIEW, TRUE, 0);
		 }
	   }

	   if (LOWORD(wParam) == 3) {
	       if(camera!=NULL)
		   {
		         ZeroMemory(&ofn, sizeof(ofn));

              ofn.lStructSize = sizeof(ofn); // SEE NOTE BELOW
              ofn.hwndOwner = crap;
              ofn.lpstrFilter = "BMP Files (*.bmp)\0*.bmp\0All Files (*.*)\0*.*\0";
               ofn.lpstrFile = szFileName;
             ofn.nMaxFile = MAX_PATH;
              ofn.Flags = OFN_EXPLORER | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
               ofn.lpstrDefExt = "bmp";

              if(GetSaveFileName(&ofn))
              {
                 SendMessage(camera, WM_CAP_FILE_SAVEDIB,0, (LPARAM *)szFileName);
                }
             
		   }
	   }
	   if (LOWORD(wParam) == 4) {
          if(camera!=NULL)
             SendMessage(camera, WM_CAP_DLG_VIDEOFORMAT,0, 0);
	   }
	   break;
    case WM_DESTROY:
    {
	    if(camera!=NULL)
		{
		  SendMessage(camera, WM_CAP_DRIVER_DISCONNECT, "Camera Irido", 0);
		  camera=NULL;
		}
		EnableWindow(hwndd, TRUE);
		SetForegroundWindow(hwndd);
        PostQuitMessage(0);
        return 0;
    }
  }
  return DefWindowProc(hwnd, msg, wParam, lParam);
}
int createCamera()
{
    MSG  msg ;    
  WNDCLASS wc = {0};
  long w,h=0;
  wc.lpszClassName = TEXT( "Static Control" );
  wc.hInstance     = GetModuleHandle(NULL);
  wc.hbrBackground = GetSysColorBrush(COLOR_3DFACE);
  wc.lpfnWndProc   = WndProc ;
  wc.hCursor       = LoadCursor(0,IDC_ARROW);
  w=GetSystemMetrics(SM_CXSCREEN)/2;
  h=GetSystemMetrics(SM_CYSCREEN)/2;
  
  RegisterClass(&wc);
  crap=CreateWindow( wc.lpszClassName, TEXT("Take picture"),
                WS_BORDER | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX,
                w-205, h-175, 410,350, 0, 0, wc.hInstance, 0);  
  ShowWindow(crap, SW_NORMAL);
  while( GetMessage(&msg, NULL, 0, 0)) {
    TranslateMessage(&msg);
    DispatchMessage(&msg);
  }
  return (int) msg.wParam;
}


void CreateDialogBox(HWND hwnd)
{
  int w=GetSystemMetrics(SM_CXSCREEN)/2;
  int h=GetSystemMetrics(SM_CYSCREEN)/2;
  CreateWindowEx(WS_EX_DLGMODALFRAME | WS_EX_TOPMOST,  TEXT("DialogClass"), "About Iridology", 
        WS_VISIBLE | WS_SYSMENU | WS_CAPTION , w-200, h-100, 400, 150, 
        NULL, NULL, GetModuleHandle(NULL),  NULL);
  EnableWindow(hwndd, FALSE);
}
LRESULT CALLBACK DialogProc( HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam )
{
static char *lyrics1 =  "\t\tIridology 2012\n\tThis program is for educational\n\t\tresearch only!";
  switch(msg)  
  {
    case WM_CREATE:
	CreateWindow(TEXT("button"), TEXT("Ok"),    
	      WS_VISIBLE | WS_CHILD ,
	      310, 10, 80, 25,        
	      hwnd, (HMENU) 1, NULL, NULL);  
 	    crap1=CreateWindow(TEXT("STATIC"), lyrics1, 
		    WS_CHILD | WS_VISIBLE | SS_LEFT,
		    40, 40, 320, 100,
		    hwnd, (HMENU) 2, NULL, NULL);
	break;

    case WM_COMMAND:
	
	

    case WM_CLOSE:
	    EnableWindow(hwndd, TRUE);
        DestroyWindow(hwnd);
        break;       

  }
  return (DefWindowProc(hwnd, msg, wParam, lParam));

}
void RegisterDialogClass(HWND hwnd) 
{
  WNDCLASSEX wc = {0};
  wc.cbSize           = sizeof(WNDCLASSEX);
  wc.lpfnWndProc      = (WNDPROC) DialogProc;
  wc.hInstance        = GetModuleHandle(NULL);
  wc.hbrBackground    = GetSysColorBrush(COLOR_3DFACE);
  wc.lpszClassName    = TEXT("DialogClass");
  RegisterClassEx(&wc);

}
LRESULT CALLBACK NewWndProc(HWND Hwnd, UINT Message, WPARAM wParam, LPARAM lParam)
{
PAINTSTRUCT ps;
HBRUSH hBrushYellow;
RECT rc;
 info *p=sProc;
  do{
     if(p->hwnd==Hwnd)
	 OldWndProc=p->wndProc;
	 p=p->nxt;
  }while(p!=NULL);
  
  switch(Message)
   {
      case WM_RBUTTONDOWN:
            {
			  RegisterDialogClass(hwndd);
			  CreateDialogBox(hwndd);
		      return 0;
                  break;

           }
           break;
      case WM_MOUSEMOVE:
	       GetClassName(Hwnd,buff,20);
		   if(strcmp(name,buff)==0)
		   return 0;
		   break;
	 	  case WM_INITMENUPOPUP:
		  if((HMENU)wParam==hMenu1)
		  {
		    EnableMenuItem(hMenu1, IDM_FILE_OPEN, MF_BYCOMMAND | MF_ENABLED);
	       // EnableMenuItem(hMenu1,IDM_FILE_NEW,MF_ENABLED);
			//EnableMenuItem(hMenu1,IDM_FILE_OPEN,MF_ENABLED);
			//EnableMenuItem(hMenu1,IDM_FILE_QUIT,MF_ENABLED);
			SendMessage(hwndd,WM_NCPAINT,0,0);
			
			return 0;
            }
			break;
	  case WM_KEYDOWN:
	      {
		   switch(wParam)
		   {
		    case VK_F1:
            GetClassName(Hwnd,buff,20);
			MessageBox(hwndd,buff,"Info key",MB_OK);
			return 0;
			break;
			default:
			   return 0;
			} 

           break;	
          }
	 case WM_LBUTTONUP:
	       {
		    if(harr[0]==NULL)
			 break;
		    GetClassName(Hwnd,buff,20);
            if(strcmp(name,buff)!=0)
             break;
			 else
			 {
			  GetClassName(GetParent(Hwnd),buff,20);
			  if(strcmp(shool,buff)!=0)
               break;
			 }
		    if(harr1[0]!=NULL)
			{
			
			 for(m=0;m<3;m++)
			 {
			  if(harr1[m]==Hwnd)
			  {
                switch(m)
				{
				 case 0:
				    SetFocus(FindWindow(shool, ""));
				    PostMessage(hwndd, 256, 114, 0);//3997697
					//SetFocus(FindWindow(shool, ""));
					 GetWindowRect(harr1[2],&rc);
					 MoveWindow(harr1[2],rc.left,rc.top-30,rc.right-rc.left,rc.bottom-rc.top,TRUE);
					 SetWindowText(harr1[2],"Next");
					 be=0;
					return 0;
				    break;
				 case 2:
				   if(be==1)
				   {
				    createCamera();
					return 0;
				   }
				   else
				   {
				   SetWindowText(harr1[2],"..");
				   be=1;
				   }
				    break;
				 case 1:
				   if(be==0)
				   {
					 GetWindowRect(harr1[2],&rc);
					 MoveWindow(harr1[2],rc.left,rc.top+30,rc.right-rc.left,rc.bottom-rc.top,TRUE);
					 SetWindowText(harr1[2],"..");
					 be=1;
				   }
				    break;
				}
			  }
			 }
			 
			}
			break;
		   }
	  case WM_SIZE:
	      {
		  if(Hwnd==hwndd)
		  {

            InvalidateRect(hwndd,NULL,TRUE);
            return 0;
			
		  }

           break;	
          }
	  case WM_PAINT:
	      {
		  if(Hwnd==hwndd)
		  {
			hdc=BeginPaint(Hwnd,&ps);
			GetClientRect(Hwnd, &rcc);
			hBrushYellow = SelectObject(hdc, CreateSolidBrush(RGB(0, 0, 0)));
            Rectangle(hdc, rcc.left,rcc.top,rcc.right,rcc.bottom);
			DeleteObject(hBrushYellow);
		  }

           break;	
          }
	  
    }
  
     if((m==0) && (Hwnd==hwndd))
	 {
      //AddMenus(hwndd);
      }
   return CallWindowProc((WNDPROC)OldWndProc, Hwnd, Message, wParam, lParam);
}
void AddMenus(HWND hwnd) {
  HMENU hMenubar;
  HMENU hMenu;
  if(GetMenu(hwnd)==NULL)
  {
  hMenubar = CreateMenu();
  hMenu = CreateMenu();
  hMenu1= hMenu;
  AppendMenu(hMenu, MF_STRING|MF_ENABLED, IDM_FILE_NEW, "&New");
  AppendMenu(hMenu, MF_STRING|MF_ENABLED, IDM_FILE_OPEN, "&Open");
  AppendMenu(hMenu, MF_SEPARATOR, 0, NULL);
  AppendMenu(hMenu, MF_STRING|MF_ENABLED, IDM_FILE_QUIT, "&Quit");

  AppendMenu(hMenubar, MF_POPUP|MF_BYPOSITION, (UINT_PTR)hMenu, "&File");
  SetMenu(hwnd, hMenubar);
  SendMessage(hwnd,WM_NCPAINT,0,0);
 m=1;
 }
 
}

DWORD WINAPI Creation()
{
   HMENU hMenu, hSubMenu;
   HWND hWnd;
   int h,w;
   long bla=0;
   info *rl;
   RECT rc;
   RECT rc1;
   while(fnd==0)
   {
    EnumWindows((WNDENUMPROC)&EnumWindowsProc,0);
	Sleep(500);
   }
if(b==0)
{

     hWnd=hwndd;
	 h = GetSystemMetrics(SM_CXSCREEN);
     w = GetSystemMetrics(SM_CYSCREEN);
	 bla=(long)FindWindow("Shell_TrayWnd", "");
	 GetWindowRect((HWND)bla,&rc);
	 bla=rc.bottom-rc.top;
	 //start of: change window style
	 /*SetWindowLong(hWnd, GWL_EXSTYLE, WS_EX_LEFT);
     SetWindowLong(hWnd, GWL_STYLE, WS_OVERLAPPEDWINDOW | WS_VISIBLE);
     SetWindowPos(hWnd, HWND_NOTOPMOST, 0, 0, h, w-bla, SWP_SHOWWINDOW);
     ShowWindow(hWnd, SW_RESTORE); */
	 //end of: change window style
     OldWndProc = SetWindowLong(hWnd, GWL_WNDPROC, (long)NewWndProc); 
     bla=GetWindowLong(hWnd, GWL_WNDPROC);
	 b=1;
	 
	 if(OldWndProc==0)
	 {
	    log = fopen("i:\\logfile.txt", "a+");
	    sprintf(buff,"SetWindowLong-failed\n");
	    fwrite(buff,1,strlen(buff),log);
	    fclose(log);
	 }

}
sProc=(info*)malloc(sizeof(info));
if(sProc==NULL)
MessageBox (0,"sssssssssssss","ssssssssssss",MB_OK);
sProc->hwnd=hwndd;
sProc->wndProc=OldWndProc;
sProc->nxt=NULL;
cProc=sProc;
while(r!=0)
{
 
    EnumChildWindows(hwndd,(WNDENUMPROC)&EnumChildProc,0);
	rl=sProc;
    if(cnt==5)
	{
	 for(h=0;h<cnt;h++)
	 {
	   GetWindowRect(harr[h],&rc);
	   if(rc.left==0)
	   ShowWindow(harr[h],SW_HIDE);
	 }
	  
	}
	if(cnt==3 && flag==1)
	{
     for(h=0;h<cnt;h++)
	 {
	   GetWindowRect(harr[h],&rc);
	   if(rc.left==0)
	   {
	     hWnd=harr[0];
		 harr[0]=harr[h];
		 harr[h]=hWnd;
		 GetWindowRect(harr[1],&rc);
		 GetWindowRect(harr[2],&rc1);
		 if(rc.top>rc1.top)
		 {
		  hWnd=harr[1];
		  harr[1]=harr[2];
		  harr[2]=hWnd;
		 }
		 for (w=0;w<3;w++)
		  harr1[w]=harr[w];
		  flag=0;
		 break;
	   }

	 }

	}
	if(cnt==2)
	harr[0]=NULL;
	cnt=0;
	Sleep(5);
}
  return TRUE;

}
BOOL CALLBACK EnumChildProc(HWND hwnd,LPARAM lParam)
{
 long f=0;
 char tmp[64];
 char buff[30];
 char pbuf[1024];  
 info *p;
 info *r;
 long *adr;
   //nsize=GetWindowTextLength(hwnd);
 GetClassName(hwnd,buff,20);
 if(strcmp(name,buff)==0)
 {
  if(IsWindowVisible(hwnd))
  {
    harr[cnt]=hwnd;
    cnt+=1;
    SendMessage(hwnd, 0xF4, 0, 1);
  }
 }
   r=sProc;
   do{
       if(r->hwnd == hwnd)
	   {
	    f=1;
	   }
	   r=r->nxt;
     }while(r!=NULL);
   if(f==0)
   {
    p=(info *)malloc(sizeof(info));
	if(p!=NULL)
	 {
	   r=cProc;
	   p->hwnd=hwnd;
	   p->wndProc=SetWindowLong(hwnd, GWL_WNDPROC, (long)NewWndProc);
	   p->nxt=NULL;
	   r->nxt=p;
	   cProc=p;
	 }
   }
 return 1;  
}
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lParam)
{
 long nsize=0;
 char title[10];
 char pName[10];
 char tmp[10];
 char buff[100];
 strcpy(pName,"Iridology");
 if(GetParent(hwnd)==0 && IsWindowVisible(hwnd))
 {
   nsize=GetWindowTextLength(hwnd);
   if(nsize>0)
   {
	 GetWindowText(hwnd,title,10);
     strcpy(tmp,title);
	 if(lstrcmp(tmp,pName)==0)
	 {
	   fnd=1;
	   hwndd=hwnd;
	   return FALSE;
	 }
   }
 }
 return TRUE;
}
void __declspec(dllexport) Blah()
{
 Creation();
}
BOOL APIENTRY DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
   if (fdwReason==DLL_PROCESS_ATTACH)
        CreateThread(0, 0, (LPTHREAD_START_ROUTINE)&Creation, NULL, 0, NULL);
   if (fdwReason==DLL_PROCESS_DETACH)
    {
     r=0;
    
    }


  return TRUE;
}
