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
  graf.uzly.each { |kl| if kl.cislo==hodnota then return kl end }
end

def bfs(graf, pocatek)
  open= Array.new
  close= Array.new
  open.push(getUzelPodleHodnoty(graf, pocatek))
  
  while !open.empty?
    uzel=open.pop;
    puts uzel
    puts uzel.cislo
        uzel.sousedi.each { |u|
        pom = getUzelPodleHodnoty(graf, u);
        if !close.include?(pom) && !open.include?(pom) then

                open.push(pom);
                
        end
           }
    close.push(uzel);

 end
end

def dfs(graf, pocatek)
  puts "ZACINAM DFS z uzlu #{pocatek} nasledujue vypis uzlu v:"
  end


solve("graf")

