package main

import (
	"github.com/steveoc64/chi-testing/state"
)

func main() {
	appstate := state.NewState(commit)
	go startServer(appstate)

	appstate.Wait()
}
