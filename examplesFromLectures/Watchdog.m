%% Tested on Emerald 0.99 %
const theHandler <- object theHandler
	%% Do whatever is appropriate here, e.g., register the node %
	%% in a list of all active nodes. %
	export operation nodeUp[n: Node, t: Time]
		(locate self)$stdout.putString["NodeUp!\n"]
	end nodeUp

	%% Do whatever is appropriate here, e.g., remove the node %
	%% from the list of all active nodes. %
	export operation nodeDown[n: Node, t: Time]
		(locate self)$stdout.putString["NodeDown!\n"]
	end nodeDown
end theHandler

const Watchdog <- object Watchdog
	process
		%% Fetch the local node %
		const here <- locate self
		%% Assigning event handler for the "master" node %
		here.setNodeEventHandler[theHandler]
		%% A never-ending loop %
		stdout.putString["Entering the loop!\n"]
		loop
		end loop
		stdout.putString["Exiting the loop!\n"]
	end process
end Watchdog
