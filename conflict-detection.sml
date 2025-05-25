fun cov place state =
  let
    val tokens = place 1 state
    val out_arcs = OutArcs state
  in
    if length tokens <> 0 then
      if length out_arcs = 0 then false
      else
        List.all (fn token =>
          List.exists (fn out_arc =>
            let
              val destination_node = DestNode out_arc
              val destination_tokens = place 1 destination_node
            in
              not (List.exists (fn destination_token => destination_token = token) destination_tokens)
            end
          ) out_arcs
        ) tokens
    else
      true
  end;
