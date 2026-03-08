import json, re
from pathlib import Path
ROOT = Path(r'C:\_IridoApp_October\ai_eye_capture_oct')
L10N = ROOT / 'lib' / 'l10n'
translations = {
'en': {
  'belowBaseline': 'Below research baseline for age {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Above research baseline for age {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'de': {
  'belowBaseline': 'Unter dem Forschungsbereich fuer Alter {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Ueber dem Forschungsbereich fuer Alter {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'es': {
  'belowBaseline': 'Por debajo del rango de investigacion para edad {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Por encima del rango de investigacion para edad {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'fr': {
  'belowBaseline': 'En dessous de la plage de recherche pour l age {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Au dessus de la plage de recherche pour l age {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'it': {
  'belowBaseline': 'Al di sotto dell intervallo di ricerca per eta {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Al di sopra dell intervallo di ricerca per eta {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'ja': {
  'belowBaseline': '年齢 {age}（{group}）の研究基準より低い',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': '年齢 {age}（{group}）の研究基準より高い',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'ko': {
  'belowBaseline': '연령 {age}({group}) 연구 기준보다 낮음',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': '연령 {age}({group}) 연구 기준보다 높음',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
'pt': {
  'belowBaseline': 'Abaixo da faixa de pesquisa para idade {age} ({group})',
  '@belowBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
  'aboveBaseline': 'Acima da faixa de pesquisa para idade {age} ({group})',
  '@aboveBaseline': {'placeholders': {'age': {'type': 'int'}, 'group': {'type': 'String'}}},
},
}
files = {'en':'app_en.arb','de':'app_de.arb','es':'app_es.arb','fr':'app_fr.arb','it':'app_it.arb','ja':'app_ja.arb','ko':'app_ko.arb','pt':'app_pt.arb','pt_BR':'app_pt_BR.arb'}
def has_key(text,key):
    return re.search(rf'"{re.escape(key)}"\s*:', text) is not None
for locale, fname in files.items():
    entries = translations['pt'] if locale == 'pt_BR' else translations[locale]
    path = L10N / fname
    text = path.read_text(encoding='utf-8')
    missing = [k for k in entries if not has_key(text, k)]
    if missing:
        idx = text.rfind('}')
        block = ''.join(f',\n  "{k}": {json.dumps(entries[k], ensure_ascii=False)}' for k in missing)
        path.write_text(text[:idx] + block + '\n' + text[idx:], encoding='utf-8')
    print(locale, len(missing))
