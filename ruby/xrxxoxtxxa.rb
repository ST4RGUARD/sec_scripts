require 'rest-client'
require 'pp'
require 'json'

# Board Layout
# [1][2][3]
# [4][5][6]
# [7][8][9]
# - empty space
# c computer piece
# p player piece

class RotaAPI

  def initialize
    @base_url = 'https://rota.praetorian.com/rota/service/play.php'
    res = RestClient.get("#{@base_url}?request=new")
    @cookies = res.cookies
  end

  def place(x)
    JSON.parse(RestClient.get("#{@base_url}?request=place&location=#{x}", :cookies => @cookies))
  end

  def move(x, y)
    res = JSON.parse(RestClient.get("#{@base_url}?request=move&from=#{x}&to=#{y}", :cookies => @cookies))
  end

  def status
    JSON.parse(RestClient.get("#{@base_url}?request=status", :cookies => @cookies))
  end

  def reset
    res = RestClient.get("#{@base_url}?request=new")
    @cookies = res.cookies
    JSON.parse(res)
  end

end


pp @game = RotaAPI.new

# ideally would write code to check board "---------" to make sure player goes first
# but ctrl-c up arrow Enter is our friend here 0_0

def gameloop()

    @game.reset

    # opening moves aren't correct or adjusted...just restart until AI chooses OUR ideal start
    # loop not running with a poor start - always reading success ..debug this later maybe

    @game.status["status"] == "success" ? (pp @game.place(1)) : gameloop()
    @game.status["status"] == "success" ? (pp @game.place(3)) : gameloop()
    @game.status["status"] == "success" ? (pp @game.place(8)) : gameloop()

    # Algorithm? Shmalgorithm
    # roughly 5sec timeout - case is fast enough
    until @game.status["data"].has_key?("hash") do
      case @game.status["data"]["board"]
        when "p-p-c-cpc","pcp---cpc","pcp-c-cp-","pcp-pcc--","pcp--ccp-","pcp-cc--p","p-p-ccc-p","p-p-cccp-"
          pp @game.move(1,4)
        when "pcpcc--p-","pcpc---pc","pcp-c--pc","p-pcc--pc","pcpcc-p--","p-pcc-p-c"
          pp @game.move(3,6)
        when "p--ccp-pc","p-cc-p-pc","pc-cc--p-","pc-ccp-p-","p-cccp-p-"
          pp @game.move(8,7)
        when "pcpc-c-p-"
          pp @game.move(8,5)
        when "pcpcp---c","c-pppcc--"
          pp @game.move(5,8)
        when "p-cc-ppc-","p-cccpp--","p-c-cppc-"
          pp @game.move(1,2)
        when "c-pp--cpc","c-pp-cc-p","-cpp-c-cp","cp-p-c-cp"
          pp @game.move(4,5)
        when "pc--cp-pc","pc---pcpc","-c-pcpcp-","---pcpcpc"
          pp @game.move(6,3)
        when "pc-c-pp-c","p-c-cpp-c","p--ccpp-c","pcp-c-p-c"
          pp @game.move(7,8)
        when "-cppcc-p-","--ppcccp-","c-ppcc-p-","c-ppcc-p-","c-pp-ccp-"
          pp @game.move(8,9)
        when "-cppc--pc","-cpp--cpc","-cpp-cc-p","-cppc-cp-","-c-pcp-pc"
          pp @game.move(4,1)
        when "pc-c-ppc-","pc-c-p-pc","p-c--pcpc"
          pp @game.move(1,5)
        when "--ccpp-pc","-cp-p-cpc"
          pp @game.move(5,1)
        when "-cpp-ccp-"
          pp @game.move(3,5)
        when "p-cc-pp-c"
          pp @game.move(6,5),"p-p-ccc-p"
        when "pc-cp-p-c","c--ppccp-","-c-pp-cpc","c--ppcc-p"
          pp @game.move(5,3)
        when "pcp-c-c-p","--ppccc-p","-cppc-c-p"
          pp @game.move(9,8)
        when "-c--ppcpc","-cp-pcc-p","c-p-pc-cp","cp--pc-cp"
          pp @game.move(5,4)
        when "p-ccp-pc-"
          pp @game.move(5,6)
        when "-pcc-ppc-","cpc---pcp","cpc--pp-c"
          pp @game.move(7,5)
        when "cpc-pp-c-","-pccpp--c","cpc-p--cp"
          pp @game.move(5,7)
        when "c-pp-c-cp","c-ppcc--p","c-ppc--cp","c-ppc-c-p"
          pp @game.move(3,2)
        when "cp--cppc-","-pc-cppc-","cpc--ppc-"
          pp @game.move(6,9)
        when "--ccpppc-"
          pp @game.move(5,2)
        when "-pcc-pp-c","-p-ccppc-","-p-ccpp-c","-pcccpp--"
          pp @game.move(2,1)
        when "cp-p-cc-p","cp-pcc--p","-p-pcc-cp"
          pp @game.move(2,3)
        when "cpc-c-p-p","-pcc--pcp","-pc-c-pcp"
          pp @game.move(9,6)
        when "cp---cpcp","cp--c-pcp"
          pp @game.move(7,4)
        when "cpcp---cp","cp-pc--cp"
          pp @game.move(4,7)
        when "cpcp--c-p"
          pp @game.move(2,5)
      end
    end
    pp @game.status["data"]["hash"]
end

gameloop()
