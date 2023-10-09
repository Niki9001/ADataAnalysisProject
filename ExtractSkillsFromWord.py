import docx
import re
import mysql.connector
import pandas as pd
from pandas import Series, DataFrame
skillsFromWord = []

"""
TODO: 这个文件获取了所有word文档里的skills，并保存到了csv
"""
#读取文件
for i in range(1,187):
    #print(i)
    doc = docx.Document(f'H:\DA Job analytics\TrainingProfileWord\extracted_profile ({i}).docx')
# 提取部分
    text = ""

    for paragraph in doc.paragraphs:
        text = text + paragraph.text + "\n"

#top skill list:
    tp = []
#提取
    def topskills(text):
        pattern = r"Top Skills.*?\n(.*?\n){3}"
        match = re.search(pattern, text, re.DOTALL)

        if match:
            # 取匹配结果，然后分割它得到三行，再去除每行的空白字符
            return [line.strip() for line in match.group().split('\n')[1:4] if line.strip()]
        else:
            return []


    skills = topskills(text)
    #print(skills)
    skillsFromWord.append(skills)

skills = []
#print(skillsFromWord)
for i in skillsFromWord:
    for j in i:
        skills.append(j)
df = pd.DataFrame(data=skills,columns=["Skills"])
print(df)
df.to_csv("skills.csv")
