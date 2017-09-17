class Pidgey
  COST = 12

  def self.calc(pidgeys, candy, aggressive_trade=false)
    total_evolutions = 0
    loop_cnt = 0
    while (candy / COST) >= 1
      loop_cnt +=1
      puts "Begin loop #{loop_cnt}, #{pidgeys} pidgeys, #{candy} candy."
      # Evolutions are candy divided by the cost
      evolutions = candy / COST
      # Calculate the remaining candy.
      candy = candy % COST
      # Subtract the evolutions from our pidgey inventory
      pidgeys -= evolutions
      # Add 1 candy for each evolutions
      candy += evolutions
      # Add to total evolutions
      total_evolutions += evolutions
      if (aggressive_trade)
        # Trade in the pigeottos for candy
        candy += evolutions
        # If we have don't already have enough candy for another evolution
        # but we do have enough extra pidgeys to make another evolution, trade them in.
        puts "Should trade?: pidgeys:#{pidgeys} candy:#{candy} Calculated: #{((pidgeys - 1) + candy) / COST}"
        if ((candy / COST < 1) && (((pidgeys - 1) + candy) / COST > 1))
          puts "Not enough candy, but I can trade some in with #{candy} candy and #{pidgeys} pidgeys."
          until (candy == COST)
            candy += 1
            pidgeys -= 1
          end
        end
      end
      puts "End loop #{loop_cnt}, #{pidgeys} pidgeys, #{candy} candy and #{total_evolutions} evolutions."
    end
    {"evolutions" => total_evolutions, "pidgeys" => pidgeys, "candy" => candy}
  end #Calc method
end #Pidgey class
#puts Pidgey.calc(27, 137, true)
