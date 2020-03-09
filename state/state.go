// state project state.go
package state

import (
	"sync"
)

// AppState holds pointers to things shared by the application
type AppState struct {
	wg     *sync.WaitGroup
	commit string
}

// NewState used to create a new state and initialise singleton objects
func NewState(commit string) *AppState {
	return &AppState{
		wg:     &sync.WaitGroup{},
		commit: commit,
	}
}

func (s *AppState) Wait() {
	if s.wg != nil {
		s.wg.Wait()
	}
}
