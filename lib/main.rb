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
    pole.each_with_index { |e, i| if i>0 then pole1[i-1]=e end}
    @sousedi = pole1
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


def solve(file)
f = File.open(file,"r")
pocet_grafu = f.readline();
g = Graph.new
pocet_grafu.to_i.times{|i|
  puts "Graph #{i+1}"
  g=Graph.new
    pocet_uzlu = f.readline().to_i
    pocet_uzlu.times { |j|
          line = f.gets
          pole = line.split(" ")
          v = Vertex.new(pole);
          g.append(v)
           }
      while line = f.gets
        if line=="0 0" or line=="0 0\n"  then break
        else
        zadani = line.split(" ")
        
        if zadani[1]=="1" then bfs(g,zadani[0])
        else dfs(g,zadani[0]) end

         end
      end
}

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
  
  while !open.empty?
    uzel=open.pop
    print "#{uzel.cislo} "

        uzel.sousedi.each { |u|
        pom = getUzelPodleHodnoty(graf, u);
        if !close.include?(pom) && !open.include?(pom) && pom!=nil then

                open.push(pom);
                
        end
           }
    
    close.push(uzel);

 end
 puts ""
end

def dfs(graf, pocatek)
  open= Zasobnik.new
  close= Zasobnik.new
  open.push(getUzelPodleHodnoty(graf, pocatek))

  while !open.empty?
    uzel=open.pop
    print "#{uzel.cislo} "

        uzel.sousedi.each { |u|
        pom = getUzelPodleHodnoty(graf, u);
        if !close.include?(pom) && !open.include?(pom) && pom!=nil then

                open.push(pom);

        end
           }

    close.push(uzel);

 end
 puts ""
  end


solve("graf")

