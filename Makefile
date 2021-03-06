PROJECT = emq_lua_hook
PROJECT_DESCRIPTION = EMQ hooks in lua
PROJECT_VERSION = 0.1

DEPS = lager luerl
dep_lager    = git https://github.com/basho/lager
dep_luerl    = git https://github.com/rvirding/luerl

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

ERLC_OPTS += +'{parse_transform, lager_transform}'
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_lua_hook.conf -i priv/emq_lua_hook.schema -d data

