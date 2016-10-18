#!/usr/bin/env bats

@test "Check hello world" {
    run bash -c "echo 'hello world' | wc -c"
    [ "$output" = 12 ]
}
