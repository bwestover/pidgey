class Pidgey
  COST = 12

  def self.calc(pidgeys, candy, aggressive_trade=false)
    total_evolutions = 0
    while (candy / COST) >= 1
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
        if ((candy / COST < 1) && (((pidgeys - 1) + candy) / COST >= 1))
          until (candy == COST)
            candy += 1
            pidgeys -= 1
          end
        end
      end
    end
    {"evolutions" => total_evolutions, "pidgeys" => pidgeys, "candy" => candy}
  end #Calc method
end #Pidgey class
