
 module Graphics
    def logo
            puts "-------------------------------------------______"
            puts "|  |   /\\   |\\ |  /   |\\/|   /\\    |\\ |   \\o/    |  "
            puts "|--|  /--\\  | \\| | _  |  |  /--\\   | \\|    |     | "
            puts "|  | /    \\ |  | |__| |  | /    \\  |  |   / \\ _--|--_ "
            puts "------------------------------------------------------"
    end

     def choose_display
      case @turns
      when 0
        turn0
      when 1
        turn1
      when 2
        turn2
      when 3
        turn3
      when 4 
        turn4
      when 5
        turn5
      when 6
        turn6
      when 7 
        turn7
      when 8
        turn8
      when 9
        turn9
      else 
        puts "____"
      end
     end
     
     def turn0
     puts ""
     end
    
     def turn1
     puts "_--|--_"
     end
    
     def turn2
      puts "   |   "
      puts "_--|--_"
     end
    
     def turn3
      puts "   |   "
      puts "   |   "
      puts "_--|--_"
     end
    
     def turn4
      puts " ------   "
      puts "      |   "
      puts "      |   "
      puts "   _--|--_"
     end
    
     def turn5
      puts " --------   "
      puts " o      |   "
      puts "        |   "
      puts "     _--|--_"
     end
     
     def turn6 
      puts "   ------    "
      puts " \\o     |    "
      puts "        |    "
      puts "     _--|--_ "
     end
    
     def turn7
      puts "  -------   "
      puts " \\o/    |   "
      puts "        |   "
      puts "     _--|--_"
     end
    
     def turn8
      puts "  -------   "
      puts " \\o/    |   "
      puts "  |     |   "
      puts "     _--|--_"
     end
    
     def turn9
      puts "  -------    "
      puts " \\o/    |    "
      puts "  |     |    "
      puts " /   _--|--_ "
     end
     
     def turn10
     puts "  --------    "
     puts " \\o/     |    "
     puts "  |      |    "
     puts " / \\  _--|--_ "
     end
end
    