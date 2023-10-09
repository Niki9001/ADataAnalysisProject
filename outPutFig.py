import pandas as pd
from pandas import DataFrame,Series
import matplotlib.pyplot as plt

df = pd.read_csv("skills.csv")

#print(df)
# 统计频率
frequ = df["Skills"].value_counts()

#print(frequ)
newDF = DataFrame(frequ)
#如果希望重新设置表头，需要用这一行代码
newDF = newDF.reset_index()
newDF.columns = ['Name','Freq']
print(newDF)

data = list(newDF['Freq'].head(41))
names = list(newDF['Name'].head(41))

plt.figure(figsize=(12,10))  # 设置图形大小
plt.barh(names, data, color='skyblue')  # horizontal bar plot
plt.xlabel('Frequency')
plt.ylabel('Skills')
plt.title('Top Skills')
labels = [str(i) for i in range(0, max(data) + 1, 4)]
plt.xticks(range(0, max(data) + 1, 4), labels)
plt.gca().invert_yaxis()  # 使得最高频率的技能在顶部
plt.tight_layout()
#plt.savefig('SkillsStat.jpg')
plt.show()
