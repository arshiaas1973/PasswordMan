$argv = ARGV

require "./generate.rb"
require "./analyse.rb"


if $argv.include?("-h") || $argv.include?("--help")
    puts <<-EOF
    
    Term to use:
        ruby passwordman.rb [Option]
        ./passwordman [Option]

    Option:
        -g [Length], --generate [Length]        : Generates a password with Length that you have specified
                                                  You can define the strength with other options
        
        -a [Password], --analyse [Password]     : Analyses the strength and length of your password

        -w, --weak                              : specified strength value (Contains Only Small Letters)
        -n, --normal                            : specified strength value (Contains Capital & Small Letters)
        -s, --strong                            : specified strength value (Contains Capital & Small Letters & Number)
        -u, --ultimate                          : specified strength value (Contains Capital & Small Letters & Number & Signs)

    EOF
    
    exit
end
if $argv.include?("-g") || $argv.include?("--generate")
    $stren = "strong";
    $minlen = 3;
    if $argv.include?("-s") || $argv.include?("--strong")
        $stren = "strong";
        $minlen = 3;
    end
    if $argv.include?("-w") || $argv.include?("--weak")
        $stren = "weak";
        $minlen = 1;
    end
    if $argv.include?("-n") || $argv.include?("--normal")
        $stren = "normal";
        $minlen = 2;
    end
    if $argv.include?("-u") || $argv.include?("--ultmate")
        $stren = "ultmate";
        $minlen = 4;
    end
       
    puts "Strength: ",$stren
        
    if $argv.include?("-g")
        puts "Length: ", $argv[$argv.find_index("-g")+1].to_i
        if $argv[$argv.find_index("-g")+1].to_i >= $minlen
            puts "Your Password is: ", generate($argv[$argv.find_index("-g")+1].to_i, $stren)
        else
            puts "Your password have to be at least #{$minlen} character long based on strength You have chosen."
            exit
        end
    end
    if $argv.include?("--generate")
        puts "Length: ", $argv[$argv.find_index("--generate")+1].to_i
        if $argv[$argv.find_index("--generate")+1].to_i >= $minlen
            puts "Your Password is: ", generate($argv[$argv.find_index("--generate")+1].to_i, $stren)
        else
            puts "Your password have to be at least #{$minlen} character long based on strength You have chosen."
            exit
        end
    end
end
if $argv.include?("-a") || $argv.include?("--analyse")
    if $argv.include?("-a")
        puts analyse($argv[$argv.find_index("-a")+1].to_s)
    end
    if $argv.include?("--analyse")
        puts analyse($argv[$argv.find_index("--analyse")+1].to_s)
    end
end

