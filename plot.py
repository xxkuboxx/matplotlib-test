from matplotlib import pyplot as plt


if __name__ == '__main__':
  labels = ['鰯', '鯖', '秋刀魚', 'リュウグウノツカイ']
  x = list(range(1, len(labels) + 1))
  y = [1, 3, 5, 15]

  plt.bar(x, y, align='center')
  plt.xticks(x, labels, rotation='vertical')
  plt.xlabel('魚の種類')
  plt.ylabel('強さ (pt)')
  plt.tight_layout()
  plt.savefig('plot.png')
