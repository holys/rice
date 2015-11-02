package main

import (
	"flag"
	"fmt"
	"runtime"

	"github.com/holys/rice"
	"github.com/holys/rice/config"
)

var (
	configFile = flag.String("config", "./etc/rice.conf", "rice config file")
)

func main() {
	flag.Parse()
	runtime.GOMAXPROCS(runtime.NumCPU())

	if len(*configFile) == 0 {
		fmt.Println("config not set")
		return
	}

	cfg, err := config.ParseConfig(*configFile)
	if err != nil {
		fmt.Printf("parse config error. [err=%s]\n", err.Error())
		return
	}

	// run
	server := rice.NewServer(cfg)
	server.Run()

	// handle signal

	// handle logger
}
