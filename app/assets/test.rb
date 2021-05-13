class Fruit
  def self.fresh
    # 正しくメソッドを定義した上で、ここに処理を記入してください
  end
 
  def initialize
    @apple = apple
    @orange = orange
    @straw = straw
  end
 
  def introduce
    
  end
 end

 # 3つのインスタンスを生成してください
apple = Fruit.new(りんご,120)
orange = Fruit.new(オレンジ,200)
straw = Fruit.new(イチゴ,60)

# クラスメソッドを呼び出し、「採れたて新鮮な果実です」と表示してください
# インスタンス毎にインスタンスメソッドを呼び出し、「【名前】は【価格】円です」と表示してください
