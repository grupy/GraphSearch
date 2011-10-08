class Graph
  @uzly
  def initialize()
    @uzly = Array.new
  end
  def append(uzel)
    @uzly.push(uzel)
    end
  def uzly
    @uzly
  end
end
class Vertex
  @cislo
  @sousedi
  @stav
  def initialize (pole)
    @cislo = pole[0]
    pole1=[]
    pole.each { |e| if e!=@cislo then pole1.push(e) end}
    pole1.uniq!
    @sousedi = pole1.sort!
    @stav=1
  end
  def cislo
    @cislo
  end
   def sousedi
    @sousedi
  end
  def stav=(newStav)
    @stav=newStav
  end
  def stav
    @stav
  end
  end
class Fronta
  @pole
  def initialize()
    @pole=Array.new
  end
  def pole
    @pole
  end
  def pop
    prvek = @pole[0]
    @pole.delete_at(0)
    return prvek
  end
  def push(prvek)
    @pole.push(prvek)
  end
  def empty?
    return @pole.empty?
  end
  def include?(prvek)
    return @pole.include?(prvek)
  end
end
class Zasobnik
  @pole
  def initialize()
    @pole = Array.new
  end
  def pop
    prvek = @pole.at(@pole.length-1)
    @pole.delete_at(@pole.length-1)
    return prvek
  end
  def push(prvek)
    @pole.push(prvek)
  end
  def empty?
    return @pole.empty?
  end
  def include?(prvek)
    return @pole.include?(prvek)
  end
end
def solve
  g=Graph.new
  pocet_uzlu = gets.to_i
    pocet_uzlu.times { |j|
          line = gets
          pole = line.split(" ")
          v = Vertex.new(pole);
          g.append(v)
           }
      while line = gets
        if line=="0 0" or line=="0 0\n"  then break
        else
        zadani = line.split(" ")
        
        if zadani[1]=="1" then bfs(g,zadani[0])
        else dfs(g,zadani[0]) end

         end
      end
end
def getUzelPodleHodnoty(graf,hodnota)
  if hodnota=='0' then return end
  graf.uzly.each_with_index { |v,i| if v.cislo==hodnota then
       return graf.uzly[i]
    end  }
end

def bfs(graf, pocatek)
  open= Fronta.new
  close= Fronta.new
  open.push(getUzelPodleHodnoty(graf, pocatek))
  print pocatek
  while !open.empty?
    uzel=open.pop
    
      
        uzel.sousedi.each { |u|
        pom = getUzelPodleHodnoty(graf, u);
        if !close.include?(pom) && !open.include?(pom) && pom!=nil then
                print " #{pom.cislo}"
                open.push(pom);
        
        end
           }
    
    close.push(uzel);

 end
 puts ""
end

def dfs(graf, pocatek)
fresh = Fronta.new
open = Fronta.new
close = Fronta.new

  mamZustatOpen=false
  uzel = getUzelPodleHodnoty(graf, pocatek)
  fresh.push(uzel);

  print pocatek
  while !fresh.empty?||!open.empty?
      if fresh.empty? then uzel=open.pop
      else uzel=fresh.pop
      end
        
      uzel.sousedi.each { |i|  
          pom=getUzelPodleHodnoty(graf, i);
          if !close.include?(pom) and !open.include?(pom) and !fresh.include?(pom) then
            
                  fresh.push(pom)
                  mamZustatOpen=true
          end
      }
      if mamZustatOpen==true then
        open.push(uzel)
        else close.push(uzel)
          if uzel.cislo!=pocatek then print " #{uzel.cislo}" end
      end
      mamZustatOpen=false
    end
    puts""
end

vstup = String.new
pocet_grafu = gets.to_i
g = Graph.new
pocet_grafu.to_i.times{|i|
  puts "graph #{i+1}"

solve()
}