export TURBINE_LAUNCH_OPTIONS="--host localhost:16"
set -x
swift-t $* loop.swift
