def generate (len, strength)
    lower = "abcdefghijklmnopqrstuvwxyz"
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    number = "1234567890"
    symbol = "`-=[];'\/.,<~!@#$%^&*()_+{}:\"|?>"
    level = 3
        
    text = ""
    l_text = ""
    u_text = ""
    n_text = ""
    s_text = ""
    
    
    l_chance = rand(lower.length)
    l_text += lower[l_chance]
    
            # upper
    u_chance = rand(upper.length)
    u_text += upper[u_chance]
    
            # number
    n_chance = rand(number.length)
    n_text += number[n_chance]
    
            # symbol
    s_chance = rand(symbol.length)
    s_text += symbol[s_chance]
    
    # lower , Upper , Number , Symbol
    case strength
       when "strong"
         level = 3
         
         # lower
         l_chance = rand(lower.length)
         l_text += lower[l_chance]
        
         # upper
         u_chance = rand(upper.length)
         u_text += upper[u_chance]
        
         # number
         n_chance = rand(number.length)
         n_text += number[n_chance]
       when "weak"
         level = 1
         
         # lower
         l_chance = rand(lower.length)
         l_text += lower[l_chance]
       when "normal"
         level = 2
         
         # lower
         l_chance = rand(lower.length)
         l_text += lower[l_chance]
        
         # upper
         u_chance = rand(upper.length)
         u_text += upper[u_chance]
       when "ultmate"
         level = 4
         
         # lower
         l_chance = rand(lower.length)
         l_text += lower[l_chance]
        
         # upper
         u_chance = rand(upper.length)
         u_text += upper[u_chance]
         
         # number
         n_chance = rand(number.length)
         n_text += number[n_chance]
        
         # symbol
         s_chance = rand(symbol.length)
         s_text += symbol[s_chance]
       else
         puts "Code is wrong: Bug 01;"
         puts "Strength: ", strength
    end
        
    for i in 1..(len-level)
      chance = rand(level)
      case chance
        when 0
            # lower
            l_chance = rand(lower.length)
            l_text += lower[l_chance]
        when 1
            # upper
            u_chance = rand(upper.length)
            u_text += upper[u_chance]
        when 2
            # number
            n_chance = rand(number.length)
            n_text += number[n_chance]
        when 3
            # symbol
            s_chance = rand(symbol.length)
            s_text += symbol[s_chance]
      end
    end
    
    #if l_text.length >= 1 && u_text.length >= 1 && n_text.length >= 1 && s_text.length >= 1
        letter_nums = Array.new
        for i in 0..(len-1)
            letter_nums << i
        end
        
        for i in 0..(len-1)
          sorting = letter_nums.sample
          case sorting
            when 0..(l_text.length-1)
                # lower
                text += lower[sorting].to_s
            when l_text.length..(l_text.length+u_text.length-1)
                # upper
                text += upper[sorting-l_text.length].to_s
            when (l_text.length+u_text.length)..(l_text.length+u_text.length+n_text.length-1)
                # number
                text += number[sorting-(l_text.length+u_text.length)].to_s
            when (l_text.length+u_text.length+n_text.length)..(l_text.length+u_text.length+n_text.length+s_text.length-1)
                # symbol
                text += symbol[sorting-(l_text.length+u_text.length+n_text.length)].to_s
          end
          letter_nums.delete(sorting)
        end
    #end
    
    return text
end