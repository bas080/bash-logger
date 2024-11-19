# Bash Logger

> Simple log functionality for bash

- Writes everything to /dev/stderr.
- STDIN support.
- Easy to setup.

## Usage

Simply source the script and use the functions it defines.


```bash
source ./bash-logger; log_error "error"
```
```
2024-11-06T12:36:53+02:00[error] error
```

An important part of the logger utility is the stdin support.

```bash
source ./bash-logger; echo 'warn' | log_warn
```
```
2024-11-06T12:36:53+02:00[warn] warn
```

## Functions

Let's checkout all the functions that exist.

```bash
grep '^function ' ./bash-logger
```
```
function logger_template()
function log ()
function logger_date ()
function log_error() { log 1 "${1:-}"; }
function log_warn()  { log 2 "${1:-}"; }
function log_info()  { log 3 "${1:-}"; }
function log_debug() { log 4 "${1:-}"; }
function log_trace() { log 5 "${1:-}"; }
```

## Variables

```bash
grep '^LOGGER_[A-Z]*=' ./bash-logger
```
```
LOGGER_FILE="${LOGGER_FILE:-/dev/null}";
LOGGER_LEVEL="${LOGGER_LEVEL:-3}";
LOGGER_TEMPLATE="${LOGGER_TEMPLATE:-}"
```

You can write the log to a file by defining the `LOGGER_FILE`.

```bash
source ./bash-logger; echo 'warn' | LOGGER_FILE="./bash-logger.log" log_info "info"
cat ./bash-logger.log
rm ./bash-logger.log # Cleaning up
```
```
2024-11-06T12:36:53+02:00[info] info
2024-11-06T12:36:53+02:00[info] info
```

How to use the `LOGGER_LEVEL`?

```bash
source ./bash-logger; log_trace "trace"
```

Notice that trace is not printed. By default the `LOGGER_LEVEL` is set to
info(3) by default.

```bash
source ./bash-logger; LOGGER_LEVEL=5 log_trace "trace"
```
```
2024-11-06T12:36:53+02:00[trace] trace
```

## Template

You can change the the template by setting the `LOGGER_TEMPLATE` or defining
your own logger_template function.

> Templates are a simple printf template. See `man printf` for more information.

By default the `LOGGER_TEMPLATE` is the following.

```bash

source ./bash-logger;

LOGGER_TEMPLATE='%s:%s:%b\n'

log_info 'Changed the LOGGER_TEMPLATE environment variable'

unset LOGGER_TEMPLATE

logger_template() {
  echo '%s|%s|%b\n'
}

log_info 'Changed the logger_template function'
```
```
2024-11-06T12:36:53+02:00:info:Changed the LOGGER_TEMPLATE environment variable
2024-11-06T12:36:53+02:00|info|Changed the logger_template function
```

## Define your own date.

You can overwrite the date format by simply defining your own logger_date function.

```bash
source ./bash-logger;

# Make sure to define your function after sourcing bash-logger.

logger_date() {
  echo 'my own date'
}

log_error 'important'
```
```
my own date[error] important
```

## Test

bash-logger uses [spat][spat] to test the output.

```bash
spat ./bash-logger.t
```
```
spat: /usr/bin/env ./bash-logger.t > ./bash-logger.t.new 2>&1
spat: All tests passed.
```

## License

[GPLv3](./LICENSE.md)

[spat]:https://github.com/bas080/spat
