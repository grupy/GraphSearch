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
  def renew
    @uzly.each{|u|
      u.stav=(1)
    }
  end
end
class Vertex
  @cislo
  @sousedi
  @stav
  def initialize (pole)
    @cislo = pole[0]
    pole1=[]
    pole.each_with_index {  |e,i| if i>1 then pole1.push(e) end}
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
  def poll(prvek)
    indexy=[]
   @pole.each_with_index{|u,i|
     if u.cislo==prvek then
      indexy.push(i)
     end
   }
   indexy.each{|i|
     @pole.delete_at(i)
   }
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
        else dfs_one_stack_only(g,zadani[0]) end

         end
      end
end
def get_uzel(graf,hodnota)
  if hodnota=='0' then return 
  else return graf.uzly[hodnota.to_i-1]
  end
end

def bfs(graf, pocatek)
  open= Fronta.new
  close= Fronta.new
  open.push(get_uzel(graf, pocatek))
  print pocatek
  while !open.empty?
    uzel=open.pop
    
       uzel.sousedi.each { |u|
        pom = get_uzel(graf, u);
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
fresh = Zasobnik.new
open = Zasobnik.new
close = Zasobnik.new

  mamZustatOpen=false
  uzel = get_uzel(graf, pocatek)
  fresh.push(uzel);

  print pocatek
  while !fresh.empty?||!open.empty?
      if fresh.empty? then uzel=open.pop
      else uzel=fresh.pop

      if uzel.cislo!=pocatek then print " #{uzel.cislo}" end
      end
      ss=uzel.sousedi.reverse
        ss.each { |i|
          pom=get_uzel(graf, i);
          if !close.include?(pom) and !open.include?(pom) then
                  fresh.poll(pom.cislo)
                  fresh.push(pom)
                  mamZustatOpen=true
                  
          end
      }
      if mamZustatOpen==true then
        open.push(uzel)
        else close.push(uzel)
      end
      mamZustatOpen=false
    end
    puts""
end
def dfs_one_stack_only(graf, pocatek)
s=Zasobnik.new
help=[]
  print pocatek
  repeat_self, pridal_jsem=false, false
  uzel = get_uzel(graf, pocatek)
  s.push(uzel);

  while !s.empty?
    uzel= s.pop
    if uzel.stav==0 then
      uzel.stav=(-1)
      if uzel.cislo!=pocatek then
        print " #{uzel.cislo}"
      end
    else
      ss=uzel.sousedi.reverse
      ss.each { |u|
        pom=get_uzel(graf, u)
        if pom.stav>=0 then
          if s.include?(pom) then
            s.poll(u)
            help.push(u)
          else
            s.push(pom)
            repeat_self=true
            pridal_jsem=true
            uzel.stav=(0)
          end
        end
    }
     if repeat_self==true then
          s.push(uzel)
        end
        
      help.reverse!.each{|f|
        s.push(get_uzel(graf, f))
      }
      if pridal_jsem==true then
        else
          if uzel.stav==1 then print" #{uzel.cislo}"
            uzel.stav=(-1)
          end
      end
      help=[]
      repeat_self=false
      pridal_jsem=false
    end
end
    puts""
    graf.renew
end

$pocatek

def recurse(graf,pocatek)
  uzel=get_uzel(graf, pocatek)

  if $pocatek!=pocatek then    print " #{pocatek}" end
    uzel.stav = 0
    uzel.sousedi.each{ |v|
        pom=get_uzel(graf,v)
        if pom.stav == 1
         recurse(graf,v)
        end
    }
    uzel.stav = 0

end
def dfs_recurse(graf,pocatek)
  $pocatek=pocatek
  print pocatek
    recurse(graf, pocatek)
    puts ""
    graf.renew
end


vstup = String.new
pocet_grafu = gets.to_i
g = Graph.new
pocet_grafu.to_i.times{|i|
  puts "graph #{i+1}"
solve()
}