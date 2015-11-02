package config

import "github.com/BurntSushi/toml"

type Config struct {
	HttpAddr string `toml:"http_addr"`
}

func ParseConfig(filename string) (*Config, error) {
	cfg := new(Config)
	_, err := toml.DecodeFile(filename, cfg)
	if err != nil {
		return nil, err
	}

	return cfg, nil
}
