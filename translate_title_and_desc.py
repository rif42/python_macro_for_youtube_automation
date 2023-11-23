import subprocess

# Install deep_translator package
subprocess.check_call(['pip', 'install', 'deep_translator'])

from deep_translator import GoogleTranslator

title = input("Enter title: ")
desc = input("Enter description: ")

langs_dict = GoogleTranslator().get_supported_languages(as_dict=True)
        
with open("result.txt", "w", encoding="utf-8") as f:
    for key,value in langs_dict.items():
        translated_title = GoogleTranslator(source='auto', target=value).translate(title)
        translated_desc = GoogleTranslator(source='auto', target=value).translate(desc)
        print(f"lang: {key}\ntitle: {translated_title}\ndesc: {translated_desc}\n")
        # result.append(f"{key}:{translated_title}\n{translated_desc}")
        f.write(str(f"{key}:{translated_title}\n{translated_desc}"))
