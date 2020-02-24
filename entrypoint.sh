#!/usr/bin/env bash

if [ -z "$APCUPS_ADDR" ]
then
    export APCUPS_ADDR=":3551"
fi

if [ -z "$APCUPS_NETWORK" ]
then
    export APCUPS_NETWORK="tcp"
fi

if [ -z "$APCUPS_TEL_ADDR" ]
then
    export APCUPS_TEL_ADDR=":9162"
fi

if [ -z "$APCUPS_TEL_PATH" ]
then
    export APCUPS_TEL_PATH="/metrics"
fi

/app/apcupsd_exporter -apcupsd.addr $APCUPS_ADDR -apcupsd.network $APCUPS_NETWORK -telemetry.addr $APCUPS_TEL_ADDR -telemetry.path $APCUPS_TEL_PATH
