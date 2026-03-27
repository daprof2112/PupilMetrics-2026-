# PupilMetrics — User Manual

**Version 5.3 · CNRI**

---

## Table of Contents

1. [Getting Started](#1-getting-started)
   - 1.1 [System Requirements](#11-system-requirements)
   - 1.2 [Installation](#12-installation)
   - 1.3 [Licensing](#13-licensing)
   - 1.4 [First Launch](#14-first-launch)
   - 1.5 [Desktop Window & Keyboard Shortcuts](#15-desktop-window--keyboard-shortcuts)
2. [Capturing Eye Images](#2-capturing-eye-images)
   - 2.1 [The Capture Workflow](#21-the-capture-workflow)
   - 2.2 [Camera Source Selection](#22-camera-source-selection)
   - 2.3 [Quality-Gated Camera Mode](#23-quality-gated-camera-mode)
   - 2.4 [Manual Camera Mode](#24-manual-camera-mode)
   - 2.5 [USB / UVC Iriscope (Dino-Lite)](#25-usb--uvc-iriscope-dino-lite)
   - 2.6 [PLR Video Mode](#26-plr-video-mode)
   - 2.7 [Import from Gallery](#27-import-from-gallery)
   - 2.8 [Tips for a Good Capture](#28-tips-for-a-good-capture)
3. [Reading the Analysis Results](#3-reading-the-analysis-results)
4. [Patient Management & Exports](#4-patient-management--exports)
   - 4.1 [Patient Information Form](#41-patient-information-form)
   - 4.2 [Scan History](#42-scan-history)
   - 4.3 [PDF Report](#43-pdf-report)
   - 4.4 [Plain-Text Report (TXT)](#44-plain-text-report-txt)
   - 4.5 [JSON Data Export](#45-json-data-export)
   - 4.6 [Sharing & Filing](#46-sharing--filing)
5. [Natural Medicine Therapy Panels](#5-natural-medicine-therapy-panels)
   - 5.1 [Enabling the Therapy Modules](#51-enabling-the-therapy-modules)
   - 5.2 [How Zone Findings Drive the Therapy Panels](#52-how-zone-findings-drive-the-therapy-panels)
   - 5.3 [Herbal Recommendations Panel](#53-herbal-recommendations-panel)
   - 5.4 [Nutrition Recommendations Panel](#54-nutrition-recommendations-panel)
   - 5.5 [Chiropractic Correlations Panel](#55-chiropractic-correlations-panel)
   - 5.6 [TCM Correlations Panel](#56-tcm-correlations-panel)
   - 5.7 [Reading Therapy Panels Together](#57-reading-therapy-panels-together)
6. [Constitutional Iridology](#6-constitutional-iridology)
   - 6.1 [Background & Theoretical Basis](#61-background--theoretical-basis)
   - 6.2 [The 34 Constitutional Types](#62-the-34-constitutional-types)
   - 6.3 [Selecting a Constitutional Type](#63-selecting-a-constitutional-type)
   - 6.4 [Constitutional Panel in Analysis Results](#64-constitutional-panel-in-analysis-results)
   - 6.5 [Constitutional Section in the PDF Report](#65-constitutional-section-in-the-pdf-report)
   - 6.6 [Clinical Guidance & Limitations](#66-clinical-guidance--limitations)
7. [Exporting PDF Reports](#7-exporting-pdf-reports)
   - 7.1 [What Affects the PDF Output](#71-what-affects-the-pdf-output)
   - 7.2 [Report Language](#72-report-language)
   - 7.3 [File Naming and Save Location](#73-file-naming-and-save-location)
   - 7.4 [Image Compression](#74-image-compression)
   - 7.5 [Regenerating a PDF](#75-regenerating-a-pdf)
8. [Settings & Customization](#8-settings--customization)
   - 8.1 [Complete Settings Reference](#81-complete-settings-reference)
   - 8.2 [Language](#82-language)
   - 8.3 [Zone Overlay & Observer Notes](#83-zone-overlay--observer-notes)
   - 8.4 [ML Comparison Panel](#84-ml-comparison-panel)
   - 8.5 [About & Support](#85-about--support)
9. [Clinical & Legal Disclaimers](#9-clinical--legal-disclaimers)
   - 9.1 [Intended Use](#91-intended-use)
   - 9.2 [Not a Medical Diagnosis](#92-not-a-medical-diagnosis)
   - 9.3 [Therapy Panel Disclaimers](#93-therapy-panel-disclaimers)
   - 9.4 [PLR Video Mode](#94-plr-video-mode)
   - 9.5 [Data Privacy](#95-data-privacy)
   - 9.6 [Image Retention](#96-image-retention)
   - 9.7 [Intellectual Property](#97-intellectual-property)

---

## 1. Getting Started

### 1.1 System Requirements

| Platform | Minimum Requirements |
|----------|---------------------|
| **Windows** (primary) | Windows 10 64-bit, 4 GB RAM, USB 2.0 port for iriscope |
| **Android** | Android 8.0+, USB OTG support for iriscope |
| **iOS** | iOS 14+, iPhone 8 or later |

An internet connection is required for initial license activation on Windows. Subsequent use is fully offline.

---

### 1.2 Installation

**Windows Desktop**
1. Run the PupilMetrics installer (`PupilMetrics_Setup.exe`).
2. The installer places the application in `Program Files\PupilMetrics` and creates a desktop shortcut.
3. If using a Dino-Lite iriscope, ensure the **DNVideoX** driver is installed before launching (see Section 2.5).

**Android**
Install from the Google Play Store or load the provided APK.

**iOS**
Install from the Apple App Store.

---

### 1.3 Licensing

#### Windows — License Tiers

PupilMetrics uses a machine-bound license on Windows. On first launch you are prompted to start a free trial or enter a license key.

| Tier | Duration | Machines |
|------|----------|----------|
| **Trial** | 14 days, full features | 1 |
| **Standard** | 1 year | 1 |
| **Professional** | Lifetime | 1 |
| **Enterprise** | Lifetime | Multiple |

**Starting the free trial**
Click **Start Free Trial** on the license screen. The 14-day countdown begins immediately. All features are available during the trial — no credit card required.

**Entering a license key**
1. Purchase a license key from CNRI.
2. On the license screen, paste your key into the **License Key** field and click **Activate**.
3. Activation contacts `licenses.cnri.edu` to bind the key to your machine ID.
4. Once activated, PupilMetrics works offline indefinitely.

**Trial expired**
If your trial expires, the license screen appears at startup. Enter a purchased license key to restore full access.

> **Note:** Moving a license to a new machine requires contacting CNRI support to unbind the old machine ID.

#### Android & iOS — In-App Purchase

On mobile, licensing is handled through the App Store / Google Play via RevenueCat. Tap **Subscribe** or **Purchase** on the paywall screen to unlock the full app.

---

### 1.4 First Launch

After licensing, the app follows this flow every time it is opened:

```
License Check
     ↓
Splash Screen
     ↓
Patient Information Screen  ← enter name, DOB, notes
     ↓
Camera Mode Selector        ← choose how to capture each eye
     ↓
Eye Capture (Right then Left)
     ↓
Analysis & Results Screen
```

**Patient Information Screen**
Fill in at minimum the patient name before proceeding. Date of birth is used for age-normalised PI ratio interpretation. Observer notes entered here are included in PDF and text exports.

---

### 1.5 Desktop Window & Keyboard Shortcuts

On Windows, PupilMetrics uses a custom title bar with minimize, maximize, and close controls. The window can be resized freely.

| Shortcut | Action |
|----------|--------|
| `F11` | Toggle fullscreen |
| `Ctrl + H` | Open scan history |
| `Escape` | Go back / close dialog |

The **Natural Medicine** settings panel (herbal, nutrition, chiropractic, TCM toggles) and the **Clinic/Practice Name** field are accessible from the settings icon in the title bar on any screen.

---

## 2. Capturing Eye Images

### 2.1 The Capture Workflow

PupilMetrics always captures **right eye first (OD)**, then **left eye (OS)**. This convention matches standard clinical iridology notation. Both images must be captured before analysis can run.

The Camera Mode Selector screen lets you choose the capture method independently for each eye, though in practice the same source is used for both.

---

### 2.2 Camera Source Selection

Tap the eye card on the Camera Mode Selector to open the source picker. The following sources are available:

| Mode | Best For |
|------|----------|
| Quality-Gated Rear Camera | Phone/tablet — automatic sharpness & exposure gate |
| Quality-Gated Front Camera | Selfie capture on mobile |
| Manual Camera | Direct camera control, manual shutter |
| USB / UVC Iriscope (Dino-Lite) | Professional iriscope via USB |
| PLR Video Mode | Pupillary light reflex (video analysis) |
| Import from Gallery | Re-analyse a previously saved iris photo |

---

### 2.3 Quality-Gated Camera Mode

The quality-gated modes are the recommended capture method on phones and tablets. A real-time quality analyser checks every frame before accepting it, preventing blurry or poorly-exposed images from entering analysis.

**How it works**
The gate evaluates each camera frame against five criteria simultaneously:

| Criterion | Acceptable Range | What it catches |
|-----------|-----------------|-----------------|
| **Sharpness** | Score ≥ 100 | Motion blur, out-of-focus iris |
| **Brightness** | 30 – 230 (0–255 scale) | Under- and over-exposure |
| **Contrast** | Score ≥ 30 | Flat, low-detail images |
| **Pupil confidence** | ≥ 30% | Frame contains a detectable pupil |
| **Centre offset** | ≤ 25% of frame | Pupil not centred enough |

**Status indicators**
- 🔴 Red border + live feedback message — one or more criteria failing; hold still and adjust position
- 🟡 Amber — borderline; minor adjustment needed
- 🟢 Green border — all criteria met; photo is captured automatically

**"Not an Eye" rejection**
Even after automatic capture, a secondary AI check confirms the image contains an iris/pupil. If a non-eye image is detected (fingers, floor, clothing), a warning dialog appears with the option to retake.

**Tips for best results**
- Stabilise the device — even small hand movement drops sharpness below threshold.
- Ensure even lighting; avoid direct sunlight on one side.
- Position the iris in the centre of the frame before getting close.
- Allow 2–3 seconds for the auto-exposure to settle after moving the camera.

---

### 2.4 Manual Camera Mode

Manual mode gives direct access to the camera shutter without the quality gate. Use this when:
- You want full control over the exact moment of capture.
- You are using a third-party macro lens attachment.
- The quality gate is rejecting good images due to non-standard lighting.

Tap the shutter button to capture. The "Not an Eye" check still runs after capture.

---

### 2.5 USB / UVC Iriscope (Dino-Lite)

PupilMetrics has deep integration with the **Dino-Lite AM4115ZT** and compatible iriscope models.

#### Windows (Dino-Lite via DNVideoX)

**Prerequisites**
- Install the Dino-Lite **DNVideoX** ActiveX driver from the Dino-Lite website before the first use.
- Connect the iriscope via USB before launching PupilMetrics.

**How it works**
PupilMetrics launches a lightweight background bridge process (`dinolite_bridge.exe`) that communicates with the iriscope via the DNVideoX COM interface. The live preview is displayed in the app.

**Capturing**
- **MicroTouch button** (recommended): Press the physical button on the Dino-Lite barrel. The image is captured instantly and the app advances to the next eye.
- **On-screen button**: Tap the capture button in the app if the physical button is not accessible.

**LED control**
The iriscope LED ring can be toggled and brightness adjusted directly from the capture screen.

**Troubleshooting**
| Symptom | Fix |
|---------|-----|
| No camera detected | Unplug and reconnect the USB cable; restart the app |
| Black preview | DNVideoX driver not installed; install from Dino-Lite website |
| MicroTouch button unresponsive | Wait 2 seconds after the preview appears for the button to arm |

#### Android (Dino-Lite via USB OTG)

Connect the iriscope to your Android device using a **USB OTG adapter**. The app automatically detects the device on the UVC camera screen. A connection status indicator appears at the top of the capture screen. Capture using the on-screen shutter button.

> **Note:** USB OTG must be supported and enabled on your Android device.

---

### 2.6 PLR Video Mode

PLR (Pupillary Light Reflex) video mode records the pupil's response to a light stimulus, allowing measurement of constriction speed and amplitude over time.

**When to use**
Use PLR mode when you need to assess neurological pupil response, not just static iris morphology.

**How to capture**
1. Select **PLR Video** from the Camera Mode Selector.
2. Choose front or rear camera and which eye.
3. Ensure the room is dim before starting.
4. Tap **Record** — a light stimulus is presented on-screen or externally.
5. The pupil constriction/dilation cycle is recorded and analysed frame-by-frame.

PLR results appear on a separate results screen and are not combined with the standard iris analysis.

---

### 2.7 Import from Gallery

Use **Import from Gallery** to load previously saved iris photos for analysis. This is useful for:
- Re-analysing archived patient images.
- Comparing results across sessions using the same raw photo.
- Testing with reference images.

**Both eyes at once**
A single gallery action prompts for the right eye image, then the left eye image in sequence.

**Single eye**
If you only have one image, you can import it for the right or left eye individually from the individual eye card on the Camera Mode Selector.

> **Tip:** Gallery images are copied into a PupilMetrics-managed folder so the original file is never modified.

---

### 2.8 Tips for a Good Capture

Regardless of capture mode, the following practices produce the best analysis results:

**Lighting**
- Use diffuse, even illumination — the built-in iriscope LED ring is ideal.
- Avoid harsh shadows across the iris.
- Avoid reflections from overhead lights on the cornea; slight repositioning eliminates most reflections.

**Distance & framing**
- The iris should fill at least 50% of the frame width.
- Keep the iris centred; a pupil near the edge of the frame reduces decentration accuracy.
- For the Dino-Lite, the optimal focal distance is approximately 2–3 cm from the eye.

**Stability**
- Rest the device or brace your hand to eliminate motion blur.
- Ask the patient to fixate on a distant point to minimise involuntary eye movement.
- Capture during natural blinking pauses — the image quality gate automatically rejects frames taken during a blink.

**Grade guide**
After analysis, each eye receives a quality grade:

| Grade | Meaning |
|-------|---------|
| **A** | High confidence — all metrics within optimal range |
| **B** | Good confidence — minor limitations, results reliable |
| **C** | Reduced confidence — consider recapture if possible |
| **D** | Low confidence — recapture recommended before clinical use |

---

*Continue to Section 3: Reading the Analysis Results →*

---

## 3. Reading the Analysis Results

After both eye captures are processed, PupilMetrics displays a detailed results screen covering six measurement areas. This section explains what each metric means, how it is calculated, and what the values signify clinically.

> **Scope of use:** All measurements are provided as clinical support tools and educational references. They are based on historical iridology and autonomic reflex research. PupilMetrics is not a diagnostic device. Results should always be interpreted by a qualified practitioner in the context of a complete patient assessment.

---

### 3.1 The Iris Zone Map

The iris is divided into **eight concentric-radial zones**, mapped by clock position. Each zone has historical associations with autonomic reflexes in corresponding body regions. Zone findings (flattenings, protrusions, ANW shifts) are reported by zone name, not clock position, so the map below is the key reference.

**Zone clock positions**

| Zone | Right Eye (OD) | Left Eye (OS) | Historical associations |
|------|---------------|--------------|------------------------|
| **Upper-Central** | 12 o'clock | 12 o'clock | Mood regulation, energy patterns (both eyes) |
| **Upper-Nasal** | 1 o'clock | 10–11 o'clock | Cognitive, cervical spine reflexes |
| **Middle-Nasal** | 2–3 o'clock | 9 o'clock | OD: oxygen utilisation, cardiac/respiratory · OS: neurological, cardiac |
| **Lower-Nasal** | 4–5 o'clock | 7–8 o'clock | Urogenital, pelvic/lumbosacral zones |
| **Lower-Basal** | 6 o'clock | 6 o'clock | OD: renal, lower extremity · OS: renal, eliminative |
| **Lower-Temporal** | 7–8 o'clock | 4–5 o'clock | OD: hepatic, metabolic · OS: cardiac, splenic |
| **Middle-Temporal** | 9 o'clock | 3 o'clock | OD: respiratory, cardiac · OS: pulmonary, cardiac |
| **Upper-Temporal** | 10–11 o'clock | 1–2 o'clock | OD: cranial nerve, auditory · OS: neurovegative, speech |

> **Note on mirroring:** The temporal and nasal sides swap between eyes. The left eye (OS) is a mirror image of the right eye (OD) — the nasal side of each eye faces the nose.

**Interactive zone overlay**

The zone map is available as a live polar overlay directly on the iris photo in the Results screen. When **Show zone overlay** is enabled (Settings → §8.3):

- **Tap or click any sector** of the polar chart to identify it. The zone name and its associated organ system are immediately displayed in the info panel directly below the chart image.
- Each tapped zone is **automatically appended to the Observer Notes field** in the format `Zone Name — Organ System`. Tapping the same zone twice will not create a duplicate entry.
- Additional free-text commentary can be typed directly in the Observer Notes field alongside the auto-populated entries. All notes are included in both the TXT and PDF exports under "Observer Notes".

This allows quick zone-to-organ cross-reference during a consultation without leaving the results screen. For structured clinical sign recording, see the **Iris Sign Finder** in §8.3.

---

### 3.2 PI Ratio (Pupil–Iris Ratio)

**What it is**
The PI ratio is the diameter of the pupil expressed as a percentage of the total iris diameter. It is the primary measurement of pupil size relative to the iris.

**Formula**
```
PI Ratio = (Pupil diameter ÷ Iris diameter) × 100
```

**Normal range**
A PI ratio of **20–30%** is considered physiologically normal for adults in standard indoor lighting. The app displays an interpreted label alongside the number:

| PI Ratio | Label |
|----------|-------|
| < 15% | Miosis (very constricted) |
| 15–19% | Constricted |
| 20–30% | **Normal** |
| 31–40% | Dilated |
| > 40% | Mydriasis (very dilated) |

**Age-normalised comparison**
Because pupil size decreases with age, PupilMetrics compares the measured diameter against an age-specific reference range. The patient's date of birth must be entered for this comparison to be shown.

| Age Group | Expected Diameter | Normal Range |
|-----------|------------------|-------------|
| Infant (< 1 yr) | 2.2 mm | 2.0 – 2.5 mm |
| Child 1–5 | 4.0 mm | 3.5 – 4.5 mm |
| Child 6–11 | 4.3 mm | 3.8 – 4.8 mm |
| Teen | 4.2 mm | 3.5 – 5.0 mm |
| Adult 20–39 | 3.5 mm | 3.0 – 4.2 mm |
| Adult 40–59 | 3.0 mm | 2.5 – 3.5 mm |
| Senior 60+ | 2.7 mm | 2.3 – 3.2 mm |

The estimated diameter is derived from the PI ratio multiplied by an assumed average iris diameter of 12 mm.

---

### 3.3 Zone Findings — Flattenings (FLAT) and Protrusions (PROT)

**What they are**
The pupil margin is assessed for local deviations from a perfect circle. Two types of deviation are detected:

| Badge | Shape | Historical interpretation |
|-------|-------|--------------------------|
| **FLAT** | Pupil margin curves *inward* at a zone | Reduced autonomic tone in that zone's reflex area |
| **PROT** | Pupil margin *bulges outward* at a zone | Increased sympathetic activity in that zone |

**Severity scale**
Each finding is graded by the percentage deviation from the expected circular margin:

| Severity | Deviation | Meaning |
|----------|-----------|---------|
| Within limits | 1.5–3.0% | Minor variation, not clinically flagged |
| Mild | 3.0–6.0% | Notable deviation, noted for observation |
| Moderate | 6.0–10.0% | Significant deviation, worth follow-up |
| Significant | > 10.0% | Strong deviation, primary clinical focus |

Deviations below 1.5% are not reported. Each zone card shows the severity percentage, the zone name, the eye (OD/OS), and the historical organ association for that zone.

---

### 3.4 ANW Assessment (Collarette / Autonomic Nerve Wreath)

**What the ANW is**
The ANW (Autonomic Nerve Wreath), also called the collarette, is a textured ring visible in the iris approximately one-third of the way between the pupil and the iris rim. It marks the transition between the inner and outer iris zones and reflects autonomic nervous system tone.

**ANW Ratio**
The ratio measures the ANW ring diameter relative to the iris diameter.

| ANW Ratio | Status | Autonomic interpretation |
|-----------|--------|-------------------------|
| < 25% | **Spastic** | ANW ring contracted inward — sympathetic dominance, hypertonicity |
| 25–35% | **Normal** | Balanced autonomic tone |
| > 35% | **Atonic** | ANW ring expanded outward — parasympathetic dominance, hypotonicity |

**ANW Asymmetry**
The asymmetry between OD and OS ANW ratios is also measured. An asymmetry of **0–5%** is normal. A larger asymmetry, particularly where one eye is Spastic and the other is Atonic, is flagged as a **Functional Frustration** pattern.

**ANW Shifts**
Local sectors of the ANW ring that deviate inward or outward from their expected position by more than **8%** are reported as ANW Shift findings (badge: **ANW**). Like FLAT/PROT findings, each shift is mapped to a clock zone and assigned its historical organ association.

**Bilateral comparison**
After both eyes are analysed, the bilateral ANW summary compares OD and OS ratios side-by-side, calculates the asymmetry, and flags the functional frustration pattern if present.

---

### 3.5 Decentration (Pupil Position)

**What it is**
Decentration measures how far the pupil centre is offset from the geometrical centre of the iris, expressed as a percentage of the iris radius.

| Decentration | Classification |
|-------------|----------------|
| < 5% | **Normal** — pupil centred within physiological limits |
| ≥ 5% | **Notable** — decentration flagged with directional pattern |

**Directional patterns**
When decentration is notable, the direction is reported as a named pattern:

| Direction | Pattern name | Zone implication |
|-----------|-------------|-----------------|
| Toward nose | Nasal | OD: pulmonary reflexes · OS: cardiac reflexes |
| Away from nose | Temporal | Renal, reproductive zones |
| Upward | Frontal | Cerebral, cognitive zones |
| Downward | Basal | OD: intracranial pressure reflexes · OS: cerebral patterns |
| Upper-inward | Upper-nasal | OD: hepatobiliary · OS: splenic, diaphragmatic |
| Upper-outward | Upper-temporal | Renal, reproductive zones |

The decentration angle is also reported in degrees (0–360°) from the horizontal, providing precise directional information for charting.

---

### 3.6 Ellipseness (Pupil Shape)

**What it is**
Ellipseness measures how circular the pupil is, expressed as the ratio of the pupil's minor axis to its major axis (100% = perfect circle, lower = more elliptical).

| Ellipseness | Classification |
|-------------|---------------|
| ≥ 95% | **Normal** — essentially circular |
| < 95% | **Anomaly** — pupil form deviation detected |

**Pupil form types**
When ellipseness falls below the normal threshold, the orientation of the ellipse is assessed to determine the form type:

| Form | Description | Historical association |
|------|-------------|----------------------|
| Circle | Normal round pupil | No pattern |
| Horizontal oval | Wider than tall | Respiratory/glandular autonomic zones |
| Vertical oval | Taller than wide | Cerebral circulation zones |
| Diagonal oval | Tilted ellipse | Urogenital zone reflexes |
| Chord-like | Flat edge on one side | Localised autonomic influence |
| Irregular | Non-uniform distortion | Multiple autonomic zone influences |

---

### 3.7 Anisocoria (Pupil Size Difference)

**What it is**
Anisocoria is the difference in pupil size between the right and left eye, expressed as an absolute percentage difference in PI ratio.

| Absolute difference | Severity | Clinical note |
|--------------------|----------|--------------|
| < 2% | **None** — within normal limits | Physiologically symmetric |
| 2–4% | **Mild** | May be physiological; monitor |
| 4–8% | **Moderate** | Notable asymmetry; flagged for observation |
| > 8% | **Severe** | Significant asymmetry; research observation flagged |

Moderate and severe anisocoria activates a TBI (Traumatic Brain Injury) indicator flag, which is noted in the results and PDF report. This flag is a research observation reference, not a diagnostic finding.

The larger pupil (OD or OS) and the absolute difference are displayed in the bilateral comparison card.

---

### 3.8 Confidence Scores & Hybrid Fusion

PupilMetrics runs **two independent analysis pipelines** on every image and then fuses their outputs into a single confidence score.

**Classical CV (pixel-based)**
The classical computer vision pipeline uses circle detection, radial sampling, and boundary-point analysis on the full-resolution image. It produces pixel-accurate iris and pupil boundaries.

**ML Model (ONNX)**
The machine learning model (`cnri_model.onnx`) is a neural network trained on iris images, resized to a normalised 224×224 crop centred on the detected iris. It outputs four regression values: PI ratio, decentration, ellipseness, and decentration angle.

**Hybrid Confidence Formula**
The four components are weighted and combined:

| Component | Weight | What it measures |
|-----------|--------|-----------------|
| Capture quality | 20% | Image sharpness, brightness, contrast from the quality gate |
| Classical CV confidence | 35% | Circle detection score from the Hough-like iris finder |
| ML plausibility | 20% | Whether the ML outputs fall within anatomically reasonable ranges |
| Cross-model agreement | 25% | How closely the two pipelines agree on PI ratio (80%), ellipseness (10%), and decentration (10%) |

The fused confidence is displayed as a percentage and maps to the familiar grade:

| Fused confidence | Grade |
|-----------------|-------|
| > 75% | **A** |
| 60–75% | **B** |
| 45–60% | **C** |
| < 45% | **D** |

**Safety caps**
If classical CV confidence falls below 25%, or if capture quality falls below 30%, the fused score is capped at 40% or 50% respectively, regardless of other components. This ensures a poor underlying image always produces a conservative grade.

**When the two pipelines disagree**
When the classical and ML results differ significantly on PI ratio (> 10% tolerance), the agreement component reduces the hybrid score. The individual classical and ML values are still shown in the results for reference when "Show ML Comparison" is enabled in settings.

---

### 3.9 Scan History

Every completed analysis is automatically saved to the local database. Access past scans via:
- **Keyboard shortcut:** `Ctrl + H` (Windows)
- **Scan History button** on the results screen

Each history record stores the full analysis result including all metrics, zone findings, ANW assessment, PDF path, and patient information. Records can be reopened to view the full results or regenerate a PDF.

---

---

## 4. Patient Management & Exports

### 4.1 Patient Information Form

Before each scan, PupilMetrics collects the following information:

| Field | Required | Notes |
|-------|----------|-------|
| **Name** | Yes | Free-text; stored verbatim in the scan record |
| **Age** | Yes | Integer years; used to select the age-normalisation group (Section 3.2) |
| **Sex** | Yes | Male / Female toggle |
| **Main complaints** | No | Free-text field for the practitioner's clinical notes; appears in all exported reports |
| **Practice / Clinic name** | No | Pre-filled from the last saved value; persists across sessions via SharedPreferences |

**Clinic name persistence**
The clinic name is automatically saved each time you tap **Continue** on the patient information screen. The next time you open the form, the field is pre-populated with the stored value, so you only need to enter it once per installation. To clear it, delete the text and tap Continue.

**Data scope**
Patient records live entirely on the local device — no data is transmitted to external servers. On Windows the database is stored in the app's Application Support directory (typically `%APPDATA%\cnri\pupilmetrics\bexel_scans.db`). On Android and iOS it uses the platform's sandboxed storage location.

---

### 4.2 Scan History

Every completed analysis is automatically saved to a local SQLite database the moment the results screen finishes loading. No manual save action is needed.

**Opening Scan History**

| Platform | How to open |
|----------|-------------|
| **Windows** | `Ctrl + H` keyboard shortcut, or the Scan History button on the results screen |
| **Android / iOS** | Scan History button on the results screen |

**What is stored per scan**

| Field | Description |
|-------|-------------|
| Patient name, sex, age | From the patient information form |
| Main complaints | Practitioner notes at time of capture |
| Scan date/time | UTC timestamp recorded at analysis completion |
| OD / OS image paths | File paths to the captured eye images (not the images themselves) |
| OD / OS result JSON | Full analysis result: PI ratio, ellipseness, decentration, ANW assessment, zone findings, confidence |
| Anisocoria JSON | Bilateral pupil size comparison result |
| Age-norm JSON | Age group, expected range, measured diameter, status |

**Searching records**
The search bar in Scan History matches against both patient name and main complaints text. The search is live — results update as you type. All results are sorted most-recent first.

**Tabs**
- **Iris Scans** — all standard analysis records (both platforms)
- **PLR Tests** — pupillary light reflex video recordings (mobile only; this tab is hidden on Windows desktop because the PLR video mode requires a phone's flash)

**Deleting a record**
Swipe a record left (mobile) or use the delete button (desktop) to remove it from the database. The associated image files are not automatically deleted from disk.

---

### 4.3 PDF Report

The PDF report is the primary export format. It is generated on-device using the `pdf` package and saved to the device's Documents folder (or shared directly on mobile).

**How to generate**

On the analysis results screen, tap the **PDF** button (printer icon). A progress indicator appears while the document is assembled, then a confirmation snackbar is shown with the saved file path.

On mobile, an additional **Share** button sends the PDF directly to any app that accepts files (email, cloud storage, messaging apps).

**Report contents (in order)**

| Section | Contents |
|---------|---------|
| Header | Report title, app version (v5.3.0), clinic name banner (if set) |
| Patient information | Name, sex, age, age group, main complaints |
| Eye images | OD and OS photos side-by-side (compressed to ≤ 2000 px wide at 85% JPEG quality) |
| Pupil size comparison | Bilateral anisocoria table: OD%, OS%, difference%, severity label |
| Capture distance metrics | OD/OS iris diameter in pixels, size match %, distance match status |
| Right eye analysis | Grade, PI ratio + label, ellipseness, circularity, decentration; zone findings (FLAT/PROT/ANW) with severity; pupil form; ANW parameters |
| Left eye analysis | Same structure as right eye |
| Research observations | Cross-eye pattern notes (bilateral ANW, decentration patterns, etc.) |
| Observer notes | Free-text notes entered in the zone overlay dialog (if any) |
| Herbal recommendations | *(If herbal mode enabled and findings exist)* Green-header section: per-finding cards with OD/OS badge, organ, conditions, herb names and evidence reference count, disclaimer |
| Nutrition recommendations | *(If nutrition mode enabled and findings exist)* Orange-header section: key nutrients, colour-coded food groups, first organ support note |
| Chiropractic correlations | *(If chiropractic mode enabled and findings exist)* Purple-header section: spinal segment, nerve roots, subluxation indicators, exercises, postural note |
| TCM correlations | *(If TCM mode enabled and findings exist)* Red-header section: organ, element, meridian clock, functions, first pattern with symptoms/formula, tonifying foods |

**Natural medicine sections are only included when:**
1. The corresponding therapy module is enabled in Settings.
2. The analysis found at least one applicable iris finding for that modality.

This keeps the PDF concise for practitioners who use only selected therapy systems.

**File name format**

```
PupilMetrics_<PatientName>_<YYYY-MM-DD_HH-mm>.pdf
```

Example: `PupilMetrics_John_Smith_2026-03-23_14-35.pdf`

---

### 4.4 Plain-Text Report (TXT)

A plain-text version of the full report can be generated from the results screen. It contains identical clinical content to the PDF but is formatted for easy pasting into EHR systems, email, or any text editor.

The TXT report includes:
- All metrics for both eyes (PI ratio, ellipseness, circularity, decentration, zone findings)
- The full ANW parameters section (diameter, perimeter, ratio, sector breakdown)
- Age-normalised comparison
- Anisocoria summary
- Research observations
- Observer notes (if entered)

The TXT report does **not** include photos or therapy recommendation sections.

---

### 4.5 JSON Data Export

The JSON export provides machine-readable access to the complete analysis result. It is intended for integration with external clinical software or research workflows.

**Top-level keys**

```json
{
  "date": "ISO 8601 UTC timestamp",
  "practice": "clinic name (if set)",
  "person": { "name", "sex", "age", "mainComplaints" },
  "ageNorm": { "ageGroup", "expectedRange", "measuredMm", "status" },
  "anisocoria": { ... },
  "captureMetrics": { "odIrisDiameterPx", "osIrisDiameterPx", "sizeMatchPercent", "distanceMatchStatus" },
  "rightEye": { ... full EyeAnalysisResult + anwAssessmentFull ... },
  "leftEye":  { ... full EyeAnalysisResult + anwAssessmentFull ... },
  "bilateralANW": { "odRatio", "osRatio", "ratioDifference", "odStatus", "osStatus", "hasFunctionalFrustration" },
  "observerNotes": "free text (if any)"
}
```

Each eye object contains the complete `EyeAnalysisResult` fields (pupil/iris radii, confidence, all zone findings, decentration, ellipse, ANW) plus a `anwAssessmentFull` block with sector-level detail.

---

### 4.6 Sharing & Filing

**Windows**
The PDF and TXT files are saved to the Windows Documents folder. After generation, the confirmation snackbar shows the full file path. Files can then be attached to emails, copied to a shared drive, or uploaded to a cloud EMR through standard Windows file management.

**Android / iOS**
After tapping **Share** (the share icon beside the PDF button), the system share sheet opens. You can send the PDF directly to:
- Email (Gmail, Outlook, etc.)
- Cloud storage (Google Drive, iCloud Drive, Dropbox)
- Messaging apps (WhatsApp, Telegram, etc.)
- Print (via AirPrint on iOS or a network printer on Android)

**Re-generating a PDF from history**
Open Scan History (`Ctrl + H` on Windows), tap a record, and the results screen reopens with all stored analysis data. The PDF button is fully functional from the history view, allowing you to regenerate or share the report at any time.

---

---

## 5. Natural Medicine Therapy Panels

The four therapy modules are **optional overlays** on top of the core iris analysis. Each panel takes the zone findings from the analysis pipeline (flattenings, protrusions, and ANW shifts) and maps them to a specific natural medicine framework. They are educational and reference tools intended for licensed practitioners who are already trained in the corresponding modality.

> **Clinical disclaimer.** The therapy panels are educational references only. They do not constitute medical advice and must not be used as the sole basis for clinical decisions. The practitioner is solely responsible for the application of any recommendation.

---

### 5.1 Enabling the Therapy Modules

Each module is toggled independently in **Settings**. Disabled modules produce no panel and no PDF section.

| Module | Setting key | Default |
|--------|-------------|---------|
| Herbal Recommendations | Herbal mode | Off |
| Nutrition Recommendations | Nutrition mode | Off |
| Chiropractic Correlations | Chiropractic mode | Off |
| TCM Correlations | TCM mode | Off |

Toggle any module on, then run a scan. If the analysis finds qualifying iris zone findings, the corresponding panel appears as a tab (or section) on the results screen and is appended to the PDF report.

---

### 5.2 How Zone Findings Drive the Therapy Panels

All four engines share the same iris zone input pipeline:

**Qualifying finding types**

| Finding type | Badge | Weighting in ranking |
|--------------|-------|---------------------|
| Flattening (lacuna / crypts) | **FLAT** | severity × 1.2 (highest priority) |
| Protrusion (raised sector) | **PROT** | severity × 1.0 |
| ANW shift (ring displacement) | **ANW** | deviation × 0.8 |

Findings are ranked by their weighted score. Each engine caps the number of displayed cards:
- Herbal engine: up to **6 zone cards**
- Nutrition engine: up to **6 zone cards**
- Chiropractic engine: up to **5 zone cards**
- TCM engine: up to **5 zone cards**

If a zone maps to an organ that the database does not cover, that zone is silently skipped. No recommendation card is generated.

**OD / OS labelling**
Every card carries an eye badge (**OD** = right / **OS** = left) so the practitioner knows which eye produced the finding. The iris zone map is mirrored between eyes: for example, the 9-o'clock zone is the right lung (OD) and the left lung (OS); the 3-o'clock zone is the left heart/pericardium (OS) and the right back/pleura (OD).

---

### 5.3 Herbal Recommendations Panel

**Data source**
The herbal database (`assets/therapy/herbal_database.json`) is derived from a 5,722-page CNRI knowledge base. It is structured as:

```
condition name → list of herbs, each with a reference count
```

The reference count reflects how many source documents cited that herb for that condition. Higher counts indicate broader cross-reference support.

**How it works**
1. The engine takes the organ keywords associated with the triggered iris zone.
2. It runs a case-insensitive prefix search across all condition names in the database.
3. Up to **4 matching conditions** per zone are returned, each with up to **6 herbs** ranked by reference count.
4. Zones are sorted so the highest-severity zone appears first.

**What the panel shows**

Each recommendation card displays:
- **Eye badge** (OD/OS) and **finding badge** (FLAT/PROT/ANW)
- **Zone name** and associated organ system
- **Severity percentage** from the iris analysis
- **Matched conditions** — up to 4 condition names relevant to that organ
- **Herb list** per condition — herb name + reference count shown as a chip; tapping a chip opens the source reference list
- **Evidence note** — total number of references for the top herb

**Disclaimer strip**
A disclaimer is shown at the bottom of every herbal card and is also printed in the PDF. It reminds practitioners that herb–drug interactions exist and that professional supervision is required.

---

### 5.4 Nutrition Recommendations Panel

**Data source**
The nutrition database (`assets/therapy/nutrition_database.json`) is structured around organ systems, with each organ entry containing:
- **Key nutrients** — vitamins, minerals, and cofactors known to support that organ
- **Color-coded foods** — foods grouped into 7 diet colors (Red, Orange, Yellow, Green, Blue/Purple, White, Brown)
- **Supportive herbs** — culinary and medicinal herbs cross-referenced to that organ
- **Organ support notes** — brief clinical rationale for the dietary approach

**The 7-Color Diet framework**
The color system is derived from the phytonutrient literature: each color group provides a different spectrum of antioxidants, flavonoids, and co-factors. The panel presents color groups as visual chips so practitioners can give patients an intuitive shopping guide.

| Color group | Representative phytonutrients |
|-------------|-------------------------------|
| Red | Lycopene, anthocyanins |
| Orange | Beta-carotene, hesperidin |
| Yellow | Lutein, zeaxanthin |
| Green | Chlorophyll, sulforaphane, folate |
| Blue/Purple | Resveratrol, anthocyanins |
| White | Quercetin, allicin (alliums) |
| Brown | Lignans, beta-glucans (whole grains) |

**When an iris zone maps to multiple organs** (e.g. the lower-basal zone maps to Kidney + Adrenal + Leg), the engine merges the nutrient, food, and herb lists from all matched organs and de-duplicates them. The `matchedOrgans` list on each card shows which organs contributed data.

**What the panel shows**

Each card displays:
- **Zone and organ**, finding type badge, severity
- **Key nutrients** — listed in priority order
- **Color-food grid** — up to 4 foods per color group, displayed as coloured chips
- **Supportive herbs** — small herb chips distinct from the herbal recommendations module
- **Organ support note** — a one-sentence clinical rationale for the dietary focus

---

### 5.5 Chiropractic Correlations Panel

**Data source**
Spinal segment data is compiled directly into the app (no external asset file is loaded at runtime). The zone-to-segment mapping follows the **pupillary-border iridology convention**:

| Iris clock position | Spinal region |
|--------------------|---------------|
| 12 o'clock (upper-central) | Upper Cervical C1–C4 |
| 10–11 / 1–2 o'clock (upper) | Mid/Lower Cervical C4–C7 |
| 9 / 3 o'clock (middle) | Upper Thoracic T1–T6 |
| 7–8 / 4–5 o'clock (lower) | Lower Thoracic T7–T12 |
| 6 o'clock (lower-basal) | Lumbar / Sacral L1–S3 |

Both eyes map to the **same spinal column** — the spine is midline, so OD and OS findings at the same clock position point to the same vertebral level.

**What the panel shows**

Each spinal segment card displays:

| Section | Contents |
|---------|---------|
| **Segment label** | e.g. "Upper Cervical C1–C4" |
| **Vertebrae** | Individual vertebrae with common names (e.g. C1 Atlas, C2 Axis) |
| **Nerve roots** | Exiting nerve roots at that level |
| **Innervated structures** | Organs and tissues supplied by those nerves |
| **Subluxation indicators** | Classic symptoms associated with fixation at this level |
| **Affected muscles** | Muscles commonly involved in nerve compromise at this level |
| **Adjusting approach** | Standard chiropractic techniques applicable to the region |
| **Exercises** | Corrective exercises, stretches, and lifestyle recommendations |
| **Postural note** | Ergonomic or postural guidance specific to this spinal region |

**Sources**
Winsor (1921) sympathetic segmental disturbances study; Cleveland Chiropractic College nerve–organ chart; Palmer textbooks; Jensen and Angerer iridology references.

---

### 5.6 TCM Correlations Panel

**Data source**
TCM data is compiled into the app (no external file). Each iris zone × eye-side combination maps to a specific TCM organ system entry. The TCM map is eye-side-specific: for example, the middle-temporal zone is the **right lung** in OD and the **left heart / pericardium** in OS — which is the same distinction already present in the iridology iris zone map.

**Five Elements framework**
Each TCM organ belongs to one of the Five Elements (Wu Xing):

| Element | Color | Season | Climate | Taste | Emotion | Sense organ |
|---------|-------|--------|---------|-------|---------|-------------|
| **Wood** | Green | Spring | Wind | Sour | Anger / Frustration | Eyes |
| **Fire** | Red | Summer | Heat | Bitter | Joy / Anxiety | Tongue |
| **Earth** | Yellow | Late Summer | Dampness | Sweet | Worry / Overthinking | Mouth |
| **Metal** | White/Grey | Autumn | Dryness | Pungent | Grief / Sadness | Nose |
| **Water** | Blue/Black | Winter | Cold | Salty | Fear / Will-power | Ears |

The element colour is used as the card accent throughout the panel.

**What the panel shows**

Each TCM card displays:

| Section | Contents |
|---------|---------|
| **Organ pair** | Primary organ + paired organ (e.g. Liver ↔ Gallbladder) |
| **Element bar** | Element name, season, climate, emotion, taste, nature (Yin/Yang) |
| **Meridian clock** | Peak 2-hour energy window (e.g. Liver: 1–3 AM) |
| **Meridian functions** | Key physiological roles in TCM theory |
| **Governs** | Body tissues governed (e.g. Liver governs tendons, nails, and the eyes) |
| **Patterns** | Common TCM imbalance patterns; each pattern lists symptoms, classical herbal formulas, and key acupoints |
| **Acupoints** | Top acupressure/acupuncture points with brief descriptions |
| **Tonifying foods** | Foods that nourish this organ in TCM dietary therapy |
| **Foods to moderate** | Foods that may stress this organ when consumed in excess |

**Imbalance patterns**
Each pattern card shows:
- Pattern name (e.g. "Liver Qi Stagnation", "Heart Blood Deficiency")
- Key symptoms in bullet form
- Classical formula names (e.g. *Xiao Yao San*, *Tian Wang Bu Xin Dan*)
- Primary acupoints (WHO standard point codes, e.g. LV3, HT7)

**Sources**
Maciocia (2005), Deadman & Al-Khafaji (2007), WHO acupoint standards (2008), Pitchford, Flaws, and compiled Jilin/Shanghai TCM texts.

---

### 5.7 Reading Therapy Panels Together

The four panels are designed to be **complementary, not redundant**. A practitioner might use:

- **Herbal panel** → identify specific botanical agents with the strongest cross-reference evidence for the affected organ system
- **Nutrition panel** → build a dietary protocol using the 7-color food guide for the same organ
- **Chiropractic panel** → identify the spinal level most likely to have neuro-functional involvement with that organ
- **TCM panel** → frame the clinical picture within Five Element theory, select meridian points, and recommend classical formulas

All four draw from the same iris zone findings, so the same flattening that generates an herbal recommendation also appears in the nutrition, chiropractic, and TCM panels — allowing the practitioner to build a cohesive multi-modality protocol from a single iris analysis session.

---

---

## 6. Constitutional Iridology

Constitutional iridology is the assessment of an individual's inherited iris structure to identify long-term physiological tendencies, organ predispositions, and constitutional health patterns. PupilMetrics implements Dr. Josef Deck's classification system, expanded and annotated by Dr. Bryan K. Marcia's CCVE manuscript.

> **Platform note:** The constitutional type selector is available on **Windows desktop only**. The constitutional panel and PDF section appear on all platforms when a type was selected before analysis.

---

### 6.1 Background & Theoretical Basis

Constitutional iridology originated with the German iridologist Dr. Josef Deck, whose work in the mid-20th century systematically grouped iris structural patterns into repeating constitutional categories. Unlike topographic iridology (which maps specific iris zones to specific organs), constitutional typing focuses on the **overall fiber texture, pigmentation pattern, and structural qualities** of the iris as a whole — providing a framework for understanding a patient's baseline reactivity, strengths, and long-term susceptibilities.

The system was further developed by Russian medical iridologist Professor Sergei Velhover and others in the European and Soviet iridology traditions. Dr. Bryan K. Marcia's CCVE manuscript (the knowledge basis for PupilMetrics's implementation) integrates Deck's original framework with German homeopathic research, linking each constitutional type to specific homeopathic remedy affinities documented in clinical practice.

**Key principle:** Constitutional type describes an inherited terrain — it indicates *inclinations and predispositions*, not current disease states. A constitutional pattern suggests what organ systems may require monitoring or support over the patient's lifetime, not what is acutely wrong today. Clinical correlation with symptoms, history, and other examination findings is always required.

---

### 6.2 The 34 Constitutional Types

PupilMetrics includes 34 constitutional types organized into six groups:

#### Group 1 — Lymphatic (8 types)

The Lymphatic constitution is the most common in light-eyed populations. The base iris is typically light blue-grey with well-defined, silk-like or wavy fibers. Subtypes are defined by the presence and character of tophi (whitish connective-tissue deposits), pigmentation, and fiber arrangement.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Pure Lymphatic** | Sparse pigment, distinct radial fibers | Lymphatic congestion, allergies, upper-respiratory catarrh, rheumatic tendency |
| **Neurogenic Sensitive** *(Neurolymphatic)* | Thin, tight, "combed-hair" fibers | CNS sensitivity, migraines, autonomic dysfunction, nervous hypersensitivity |
| **Neurogenic Robust** | Thick radials on two levels, transversals | Good nerve vitality but serous membrane susceptibility; overstrain leads to nervous exhaustion |
| **Lymphatic-Hypoplastic** | Thickened collarette, crypts, cloudy pupillary zone | Impaired digestion/assimilation, gastric insufficiency, lowered resistance |
| **Hydrogenoid-Hydrogenic** | Rounded, well-defined white-to-off-white tophi | Strong allergic/exudative tendency, asthma, eczema, weather-related rheumatism |
| **Hydrogenoid-Rheumatic** | Tophi with string-like connections to lymph region | More pronounced rheumatic tendency than base Hydrogenic; dysbiosis |
| **Classic Rheumatic** | Transparent tophi and wisps; scurf rim | Exudative diathesis, streptococcal rheumatic group, joint pain, chronic allergies |
| **Rheumatic-Uric Acidic** | Enhanced plaques and wisps in stroma | Uric acid diathesis; urate stone tendency; liver/kidney uric acid metabolism disorder |

#### Group 2 — Haematogenic (2 types)

The Haematogenic constitution is defined by a uniformly dark brown iris with velvet-like texture and heavy pigmentation. It is associated with blood and metabolic disorders.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Haematogenic I** | Dense velvet-brown iris, sanded-wood light patches | Blood composition dyscrasia; metabolic disorders of liver and pancreas |
| **Haematogenic II** | Brown scleral pigmentation; endocrine signs | Arteriosclerosis, gallstones, hemorrhoids, phlebitis, thyroid and endocrine disorders |

#### Group 3 — Biliary / Mixed (9 types)

The Biliary/Mixed iris shows dispersed brown pigmentation overlying a lighter stroma — producing a light brown appearance with blue-green undertones. The liver, gallbladder, and biliary tract are the primary organ affiliations.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Classic Biliary** *(Mixed Iris)* | Light brown iris; dense nutritive zone pigment | Liver/gallbladder congestion; digestive errors; constipation, flatulence, blood sugar instability |
| **Ferrum Chromotosis** | Golden-brown/red-brown pigments encircling collarette | Hepatic parenchyma damage; fat metabolism difficulty; fatigue; depression |
| **Rheumatic-Uric Acidic-Dyscratic Gr.1** | Central heterochromia; plaques/tophi; cramp rings in liver zone | Rheumatic illness; uric acid metabolism disorder; gastric secretion imbalance |
| **Rheumatic-Uric Acidic-Dyscratic Gr.2** | Strong pigmentation; scurf rim; dispersed liver pigments | Increased chronic inflammatory tendency (sinusitis, appendicitis, tonsillitis) |
| **Rheumatic-Dyscratic-Hepatic** | Distinct tophi/plaque pigmentation; liver-zone darkening | Chronic rheumatism combined with liver dysfunction; dysbiosis |
| **Rheumatic-Uric Acidic-Dyscratic-Hepatic** | Full-iris pigmentation; uric acid clouds; progressed plaques | Chronic rheumatism, uric acid complications, liver and biliary involvement |
| **Rheumatic-Arthrotic** | Mixed iris; brown/yellow tophi pigment; border pigments | Arthrotic chronic rheumatic illness; liver/kidney metabolic irregularity |
| **Rheumatic-Arthrotic-Dyscratic** | Stronger tophi/plaque pigmentation; uric acid granules | Degenerative joint disease; dyspepsia; gastric secretion disorders |
| **Arthrotic-Dyscratic-Dysenzymatic** | Haematogenic transition; rheumatic plaques; stomach-field outline | Liver, pancreas, GI disorders; raised uric acid, blood lipids, blood sugar |

#### Group 4 — Pathological Constitutions (6 types)

Pathological constitutions represent inherited structural weakness patterns identifiable as lacunae, defect markings, or corneal signs, regardless of primary iris color.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Glandular Pathological** | Petal-pattern lacunae around collarette; distended collarette | Endocrine/exocrine glandular weakness; diabetes predisposition; anxiety, depression |
| **Immuno-Pathological** | Grey/black substance-defect points; absent or broken frill | Poor immune resistance; frequent infections; poor physical endurance |
| **Cardio-Pathological** | Open defect marking at 3 o'clock (heart zone) on frill | Inborn left cardiac insufficiency risk; endocarditis/myocarditis susceptibility |
| **Vegetative-Spastic** *(Larvate Tetanic)* | Cramp rings (circular contraction furrows); radial folds | Elevated neuromuscular tension; spasms; migraines; anxiety; hypocalcemia |
| **Mesenchymal Pathological** *(Weak Connective Tissue)* | Large, numerous lacunae; honeycomb patterns; irregular collarette | Inherited connective tissue weakness; varicosities; prolapse; spinal subluxations; fractures |
| **Lipaemic Pathological** | Arcus senilis / cholesterol ring (corneal sign, not iris) | Raised blood lipids; premature arteriosclerosis; stroke risk; liver/fat metabolism disorder |

#### Group 5 — Syndromes (6 types)

Syndromes represent combined constitutional expressions involving specific organ pairings, visible as lacunae patterns in defined iris sectors.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Cardio-Renal** | Lacunae in heart AND kidney fields (left iris); scurf rim | Left cardiac + renal insufficiency; edema; dyspnea; begins in middle age |
| **Cardio-Abdominal** | Large heart lacuna; colonic lacunae; distended collarette in splenic flexure | Colon congestion mechanically stressing heart; flatulence; cardiac dyspnea |
| **Pancreatic** | Lacunae in pancreatic sector and bronchial zone | Multi-glandular insufficiency; hereditary bronchial and pancreatic weakness; childhood infections |
| **Hepato-Gastric** | Liver pigment over liver zone; radial/transverse line from pylorus to liver zone | Liver/gallbladder disturbance; possible erosive ulcer; jaundice tendency |
| **Hepato-Lienal** | Dirty yellow ciliary pigment; dark spleen field (splenic triad) | Spleen enlargement; venous congestion; viral infections; pancreatic excretory dysfunction |
| **Hepato-Renal** | Green-brown-yellow "liver iris"; transversals in liver-kidney zones | Full range of liver and kidney disorders; poor food tolerance; hypotension |

#### Group 6 — Pre-Cancerous Constitutions (3 types)

Pre-cancerous constitutions describe inherited miasmatic terrains associated with chronic toxicosis, metabolic retention, and increased neoplasm risk. These require the greatest caution in clinical interpretation and must never be communicated to a patient without full clinical context.

| Type | Key Feature | Primary Tendencies |
|------|-------------|-------------------|
| **Psoric** | Loose ciliary zone with crypts; open/closed lacunae near collarette; unequal pupils | Immune system pathology; allergic diseases; skin eruptions; reduced drug tolerance |
| **Sycotic** | Dark pupillary zone; brighter ciliary zone from contraction furrows; scurf rim | Viral/bacterial immune sensitivity; endocrine disturbances; condyloma; arthritis |
| **Carbon Nitrogen** | Dark pupillary crypts; yellow-brown humoral zone; scurf rim; splenic triad | Carbonic/nitrogen waste accumulation; neoplasm tendency from retained toxicosis; arteriosclerosis |

---

### 6.3 Selecting a Constitutional Type

Constitutional type selection is performed on the **"Both Eyes Captured"** screen, which appears after both left and right eye photos have been taken. At this point the practitioner has both eye images visible side by side — the appropriate moment for constitutional assessment, since Deck's system requires evaluation of both irides together.

**To select a type (Windows desktop only):**

1. Complete the right eye capture (Step 1 of 2).
2. Complete the left eye capture. The screen title changes to **"Both Eyes Captured"** when both images are present.
3. Scroll below the eye image pair. An amber-bordered panel labelled **"Constitutional Type (Optional)"** is visible.
4. Click the dropdown to open it. Types are organized by group with non-selectable group dividers.
5. Select the appropriate type. The type name is confirmed below the dropdown.
6. Leave the dropdown at **"None (not assessed)"** to omit the constitutional section entirely from the analysis and PDF.
7. Tap **Analyze Both Eyes** to proceed.

> **Session persistence:** The selected type is held in memory for the current session. If you navigate back to the Both-Eyes-Captured screen, the previously selected type is restored. The selection is cleared when a new scan session begins from the home screen.

**Assessment approach:** Constitutional typing requires experience and ideally evaluation of the iris under magnification (slit lamp or iriscope). The practitioner should consider:

- **Iris base color** — blue-grey → Lymphatic group; dark brown → Haematogenic; light brown/mixed → Biliary/Mixed
- **Fiber density and texture** — tight/silk-like vs. loose/wavy vs. coarsely woven with lacunae
- **Tophi and plaques** — presence, definition, and color of connective-tissue deposits
- **Pigmentation pattern** — central heterochromia, scurf rim, liver-zone pigments, dispersed spots
- **Special structures** — cramp rings, heart-zone defect markings, arcus senilis/lipaemic ring

When the constitutional group is clear but the exact subtype is uncertain, selecting the base type (e.g., *Pure Lymphatic*, *Classic Biliary*, *Haematogenic I*) is preferable to guessing a complex subtype.

---

### 6.4 Constitutional Panel in Analysis Results

When a constitutional type has been selected, an amber-bordered **Constitutional Iridology** panel appears in the Analysis Results screen, positioned **after the bilateral comparison card and before the Natural Medicine Therapy panels**.

The panel contains three collapsible sections:

| Section | Content | Default |
|---------|---------|---------|
| **Iris Description** | Full description of the iris structural and pigmentation features that define this constitutional type | Expanded |
| **Health Predispositions** | Bulleted list of organ systems, disease tendencies, and physiological patterns associated with this constitution | Expanded |
| **Homeopathic Remedies** | Chip tags showing the German homeopathic remedies with constitutional affinity for this type, from Dr. Marcia's CCVE research | Collapsed |

Tap any section header to expand or collapse it independently.

> **Relationship to zone findings:** The constitutional panel is independent of the automated iris zone analysis. Zone findings (flattenings, protrusions, ANW shifts) reflect current or acquired changes; constitutional type reflects the inherited structural terrain. Both perspectives are complementary and intended to be read together.

---

### 6.5 Constitutional Section in the PDF Report

When a constitutional type is selected, the exported PDF includes a dedicated **Constitutional Iridology** section inserted between the bilateral ANW (collarette) assessment and the Natural Medicine therapy sections.

The PDF section uses a light, print-optimized layout:

| Part | Appearance |
|------|-----------|
| Header bar | Warm cream background — constitution name in bold, group badge in solid amber |
| Iris Description | Light blue tint background, black body text |
| Health Predispositions | Light peach tint, dash-bulleted list in black |
| Homeopathic Remedies | Light green tint, remedy chips with dark green text and border |
| Footer | Grey italic — *"Based on Dr. Josef Deck's Constitutional Iridology — for educational reference only."* |

If no constitutional type was selected, this section is omitted from the PDF entirely.

---

### 6.6 Clinical Guidance & Limitations

**Training required.** Accurate constitutional typing requires formal training in iridology. Practitioners unfamiliar with constitutional iridology should complete dedicated training before using this feature clinically.

**Not a diagnosis.** Constitutional patterns describe inherited tendencies, not diagnoses. A patient with a Cardio-Pathological constitution has an inherited structural predisposition — they do not necessarily have heart disease. Constitutional findings must always be interpreted alongside the patient's full history, symptoms, and conventional medical evaluation.

**Homeopathic remedies.** The remedy affinities listed for each type reflect traditional German homeopathic-iridology correlations from the CCVE research base. They are provided for **educational reference only**. Homeopathic prescribing is individualized and requires formal homeopathic training; the constitutional type alone does not constitute a prescription.

**Pre-cancerous constitutions.** The Psoric, Sycotic, and Carbon Nitrogen types carry a "pre-cancerous" label in traditional constitutional iridology. This describes an inherited metabolic terrain, not a prediction or diagnosis of cancer. These findings must **never** be communicated as a cancer risk without full evaluation by a qualified oncologist. Practitioners in jurisdictions where such communication could constitute an unlicensed diagnostic statement must exercise particular caution.

**Windows-only selection.** The constitutional dropdown is available only on Windows desktop. The constitutional panel and PDF section will appear on all platforms if a type was selected during a Windows session — but the type cannot be modified on mobile.

---

## 7. Exporting PDF Reports

### 7.1 What Affects the PDF Output

The PDF report is assembled at the moment you tap the export button. Several settings influence its final content:

| Setting | Effect on PDF |
|---------|--------------|
| **Include images in PDF** (on by default) | OD and OS photos are embedded side-by-side on page 1. Turning this off produces a smaller, text-only document |
| **Practice / Clinic name** | Appears in a teal banner below the report title on every page header |
| **Language** | The entire report — section headings, metric labels, status labels, finding descriptions — is generated in the currently active app language |
| **Herbal / Nutrition / Chiropractic / TCM mode** | Each enabled module adds a section at the end of the report, but only when at least one qualifying finding is present |
| **Auto-save PDF** (off by default) | When enabled, the PDF is saved automatically at the end of every analysis without requiring a manual tap |

### 7.2 Report Language

The PDF is generated using the active interface language at the time of export. All localizable strings — including metric names, zone finding descriptions, ANW status labels, age group names, and therapy section headings — are pulled from the same localization tables used by the on-screen interface.

Supported languages: English, Spanish, Portuguese (Brazil), French, German, Japanese, Korean, Italian.

To export a report in a specific language, switch the app language in Settings before tapping the PDF button. You can switch back immediately after.

### 7.3 File Naming and Save Location

**File name format**
```
PupilMetrics_<PatientName>_<YYYY-MM-DD_HH-mm>.pdf
```

Spaces in the patient name are preserved. The timestamp is in local time.

**Save location**

| Platform | Default save path |
|----------|-----------------|
| **Windows** | `%USERPROFILE%\Documents\PupilMetrics_<name>_<date>.pdf` |
| **Android** | App documents directory (accessible via Files app) |
| **iOS** | App documents directory; use Share to send to Files, iCloud, etc. |

**Auto-save**
When Auto-save PDF is enabled, the file is written silently immediately after analysis completes. No dialog appears. A snackbar confirms the path. On mobile, the file is saved locally; you can then share it manually.

### 7.4 Image Compression

When images are included, each eye photo is compressed before embedding to keep the PDF file size manageable:
- Maximum width: **2,000 pixels**
- JPEG quality: **85%**

Very large iriscope images (e.g. Dino-Lite at full 5 MP resolution) are automatically downscaled. This keeps typical PDF sizes in the 1–4 MB range without a visible loss of clinical detail in the printed output.

### 7.5 Regenerating a PDF

Any past scan stored in Scan History can have its PDF regenerated at any time:

1. Open Scan History (`Ctrl + H` on Windows, or the Scan History button).
2. Tap the scan record.
3. The full results screen reopens with all stored data.
4. Tap the PDF button to generate a fresh report.

The regenerated PDF will use the **current** app language and the **current** clinic name setting, which may differ from the original scan if settings have changed since.

---

## 8. Settings & Customization

Settings are stored via SharedPreferences and persist across app restarts. On Windows they survive app updates. There is no dedicated Settings screen — all settings are accessible from the **title-bar menu** (Windows) or the **main menu** on mobile.

### 8.1 Complete Settings Reference

#### Camera & Capture

| Setting | Default | Options / Range | Effect |
|---------|---------|-----------------|--------|
| **Preferred camera** | Dino-Lite | `dino_lite`, `usb_camera`, `auto_detect` | Pre-selects the camera source on the camera mode selector page |
| **Default zoom** | 1.0× | 1.0× – 4.0× | Starting zoom level applied when the standard camera opens |

The zoom slider maps a stored value of 0.0–1.0 to a display range of 1.0×–4.0× (formula: `display = 1.0 + stored × 3.0`). Setting zoom to 0 stored = 1.0× display (no zoom).

#### Report & PDF

| Setting | Default | Effect |
|---------|---------|--------|
| **Auto-save PDF** | Off | Save PDF automatically at end of every analysis |
| **Include images in PDF** | On | Embed OD/OS photos in the PDF; turn off to reduce file size |

#### Analysis Display

| Setting | Default | Effect |
|---------|---------|--------|
| **Show ML comparison** | On | Displays the ML model's raw output values alongside the classical CV result on the results screen, for practitioner reference |
| **Show zone overlay** | On | Enables the interactive polar zone overlay on the iris photo on the results screen; tap zones to see finding details and add observer notes |

#### Practice Information

| Setting | Default | Effect |
|---------|---------|--------|
| **Practice / Clinic name** | *(empty)* | Text entered here (or on the patient info form) appears as a teal banner in every report header |

#### Natural Medicine Modules

| Setting | Default | Effect |
|---------|---------|--------|
| **Herbal mode** | Off | Enable herbal recommendation panel and PDF section |
| **Nutrition mode** | Off | Enable 7-color diet nutrition panel and PDF section |
| **Chiropractic mode** | Off | Enable chiropractic spinal correlation panel and PDF section |
| **TCM mode** | Off | Enable Traditional Chinese Medicine meridian panel and PDF section |

All four therapy toggles are independent. Enable only the modalities relevant to your practice.

### 8.2 Language

The app ships with 8 languages. Change the language from the language selector (globe icon in the title bar on Windows, or the language option in the main menu on mobile).

| Code | Language |
|------|----------|
| `en` | English |
| `es` | Spanish |
| `pt_BR` | Portuguese (Brazil) |
| `fr` | French |
| `de` | German |
| `ja` | Japanese |
| `ko` | Korean |
| `it` | Italian |

The language preference is remembered between sessions. The PDF report follows the active language at export time (see Section 6.2).

### 8.3 Zone Overlay & Observer Notes

When **Show zone overlay** is on, the iris photo on the results screen displays an interactive polar overlay. Each clock-hour sector is tappable:

- Tap any zone to open its detail panel showing all FLAT/PROT/ANW findings in that zone, the associated organ system, and a text field for **observer notes**.
- Each tapped zone is **automatically appended to the Observer Notes field** in the format `Zone Name — Organ System`. Tapping the same zone twice will not create a duplicate entry.
- Additional free-text commentary can be typed directly in the Observer Notes field alongside the auto-populated entries.
- Observer notes are included as a named section in both the TXT report and the PDF report under "Observer Notes / Zone Overlay".
- Notes are session-local — they are not stored in the database between sessions.

#### Iris Sign Finder (Add Finding)

Below the Observer Notes field, an **Add Finding** panel allows the practitioner to record structured iris sign observations for the currently selected zone. This is based on the Bexel IRINA clinical classification system.

**Workflow:**

1. Tap any zone on the polar overlay — the zone name and organ system are displayed and locked.
2. Tap the amber **Add Finding** header to expand the panel.
3. Select an **Anomaly type** from the dropdown. Organ-specific types appear at the top of the list automatically:

| Anomaly type | Notes |
|---|---|
| **Stroma change** | Structural fibre changes; select a subtype |
| **Organic pigment spot** | Pigmentation deposits; auto-generates clinical conclusion |
| **Slagging** | Microcirculation / connective tissue changes; auto-conclusion |
| **Toxic radii** | Radial sulci patterns; select a subtype |
| **Heterochromia** | Pigmentation variations; select a subtype |
| **Scurf rim** *(lung zones only)* | Local intoxication indicator; auto-conclusion |
| **Adaptive rings / arcs** *(lung zones only)* | Bronchospastic predisposition; auto-conclusion |
| **Autonomous wreath anomaly** *(cardiac zones only)* | ANW irregularity in cardiovascular zones |

4. If the selected type has **subtypes**, tap the appropriate chip (e.g. *Lacunae*, *Hyperemic sulci*, *Sectoral hyperpigmentation*).
5. Types with known clinical significance display an automatic **Conclusion** text drawn from the iridology reference database.
6. Tap **Add to Notes** — a structured entry is appended to the Observer Notes field in the format:

```
[Zone Name] Anomaly type › Subtype
  → Clinical conclusion text (if applicable)
```

7. The picker resets automatically, ready for the next zone finding.

> **Note:** Clinical terminology (Stroma change, Lacunae, Hyperemic sulci, etc.) is intentionally kept in the original Latin/Greek form as standard iridology reference language, regardless of the app's display language. The panel UI labels (Add Finding, Anomaly type, Subtype, Conclusion, Add to Notes) are fully localised into all 15 supported languages. Additional organ-specific sign types will be added to the database in future updates.

### 8.4 ML Comparison Panel

When **Show ML comparison** is enabled, the results screen shows a secondary card beneath the main analysis card for each eye. This card displays the raw ONNX model output:

| ML output | Description |
|-----------|-------------|
| PI ratio (ML) | The model's independent pupil-to-iris ratio estimate |
| Ellipseness (ML) | Model ellipseness output (note: calibration data shows near-constant output in current model) |
| Decentration (ML) | Model decentration output (same calibration caveat) |
| ML Plausibility | The ML component of the hybrid confidence score |

This panel is primarily intended for practitioners who want to inspect the raw model output alongside the classical CV result. In routine clinical use it can be left on without any negative effect.

### 8.5 About & Support

Access the About dialog from the title bar (Windows: help menu → About) to view:
- App version
- CNRI protocol reference
- Copyright notice (© 2024–2026 PupilMetrics Research)
- Links to the CNRI website and Privacy Policy
- Support email: `helpdesk@cnri.edu`

---

## 9. Clinical & Legal Disclaimers

### 9.1 Intended Use

PupilMetrics is a **research and educational tool** for licensed healthcare practitioners trained in iridology, natural medicine, or related fields. It is designed to assist in the observation and documentation of iris and pupil features as part of a broader clinical assessment.

PupilMetrics is **not** a medical device. It is not approved, cleared, or certified by any regulatory authority (FDA, CE, TGA, or equivalent) for diagnostic use in any medical context.

### 9.2 Not a Medical Diagnosis

All measurements, findings, and reports generated by PupilMetrics — including PI ratio, ellipseness, decentration, zone findings, ANW assessments, anisocoria readings, age-normative comparisons, hybrid confidence scores, and all therapy panel content — are:

- **Observational and educational only**
- **Not diagnostic conclusions**
- **Not a substitute for a clinical examination** by a licensed medical or allied health practitioner
- **Not intended to guide, change, or replace any medical treatment**

The practitioner using this software is solely responsible for all clinical decisions made in connection with its output.

### 9.3 Therapy Panel Disclaimers

Each therapy panel carries its own disclaimer that also appears in the PDF report:

| Panel | Disclaimer text |
|-------|----------------|
| **Herbal** | "Herbal suggestions are provided for educational purposes only. Consult a qualified healthcare practitioner before use." |
| **Chiropractic** | "Chiropractic information is provided for educational purposes. Consult a licensed chiropractor for diagnosis and treatment." |
| **TCM** | "TCM information is provided for educational purposes. Consult a licensed acupuncturist or TCM practitioner." |
| **Nutrition** | Dietary information follows the 7-Color Diet educational framework. Individual nutritional needs vary; consult a registered dietitian for personalised guidance. |

Herb–drug interactions exist. Herbal recommendations must never be applied without first reviewing the patient's current medications and medical history with a qualified practitioner.

### 9.4 PLR Video Mode

The Pupillary Light Reflex (PLR) video mode carries an additional research-only disclaimer:

> "Results are NOT medical diagnoses. Consult a healthcare professional."

PLR analysis is an experimental feature. Velocity, amplitude, and latency measurements depend on ambient lighting, camera frame rate, and flash consistency. They should be interpreted only by practitioners trained in pupillometry and only as one component of a full clinical picture.

### 9.5 Data Privacy

All patient data — names, ages, scan records, images — is stored **locally on the device only**. No patient data is transmitted to CNRI servers, cloud services, or any third party. License validation communicates only the machine-generated license key and activation status; no patient identifiers are included.

The practitioner is responsible for ensuring that local data storage and any subsequent sharing of exported reports complies with applicable patient privacy laws (HIPAA, GDPR, Australian Privacy Act, etc.) in their jurisdiction.

### 9.6 Image Retention

Captured eye images are stored as files in the app's local storage directory. Deleting a scan record from Scan History removes the database entry but does **not** automatically delete the image files from disk. To fully remove a patient's data, the practitioner must also delete the associated image files from the device's file system.

### 9.7 Intellectual Property

The iris zone reference chart and clinical threshold data are based on Dr. Bryan K. Marcia's 2004 CNRI Reference Charts. The herbal database is derived from CNRI knowledge base materials. The ONNX model (`cnri_model.onnx`) is proprietary to CNRI. All content is © 2024–2026 PupilMetrics Research. Unauthorized distribution, reverse engineering, or extraction of any embedded database or model is prohibited.

---

*End of PupilMetrics User Manual — Version 5.3 · CNRI*

---

> For technical support, email **helpdesk@cnri.edu** or visit **cnri.edu**.
