def analyse(pass)
    len = pass.length
    lower = "abcdefghijklmnopqrstuvwxyz"
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    number = "1234567890"
    symbol = "`-=[];'\/.,<~!@#$%^&*()_+{}:\"|?>"
    sec = Array.new
    num = Array.new
    strength = "weak"
    length = "short"
    message = "\nPassword: #{pass}\n"
    
    for i in 0..(len-1)
        
        if lower.include?(pass[i])
            if !sec.include?("lower")
                sec << "lower"
                num[sec.find_index("lower")] = 1
            else
                num[sec.find_index("lower")] += 1
            end
        elsif upper.include?(pass[i])
            if !sec.include?("upper")
                sec << "upper"
                num[sec.find_index("upper")] = 1
            else
                num[sec.find_index("upper")] += 1
            end
        elsif number.include?(pass[i])
            if !sec.include?("number")
                sec << "number"
                num[sec.find_index("number")] = 1
            else
                num[sec.find_index("number")] += 1
            end
        elsif symbol.include?(pass[i])
            if !sec.include?("symbol")
                sec << "symbol"
                num[sec.find_index("symbol")] = 1
            else
                num[sec.find_index("symbol")] += 1
            end
        else
            if !sec.include?("unknown")
                sec << "unknown"
                num[sec.find_index("unknown")] = 1
            else
                num[sec.find_index("unknown")] += 1
            end
        end
        
    end
    
        case sec.length
          when 1
              strength = "a weak"
          when 2
              strength = "a normal"
          when 3
              strength = "a strong"
          when 4
              strength = "a epic"
          when 5
              strength = "a really secure"
        end
        
        case len
          when 0..6
              length = "a short"
          when 7..12
              length = "not a long"
          when 13..16
              length = "a long"
          when 16..20
              length = "a really long"
          when 20..30
              length = "a extremely long"
        end
        
        for j in 0..(sec.length-1)
            message += " It has #{num[j]} #{sec[j]} characters\n"
        end
        
        message += "After all,\n Its #{strength} password.\n Its #{length} password."
        
        return message
end