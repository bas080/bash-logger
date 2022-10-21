# Bash Logger

> Simple log functionality for bash

- Writes everything to /dev/stderr.
- STDIN support.
- Easy to setup.

## Usage

Simply source the script and use the functions it defines.


```bash bash 2>&1
source ./bash-logger; log_error "error"
```
```
2022-10-21T10:43:59+02:00[error] error
```

An important part of the logger utility is the stdin support.

```bash bash 2>&1
source ./bash-logger; echo 'warn' | log_warn
```
```
2022-10-21T10:43:59+02:00[warn] warn
```

## Functions

Let's checkout all the functions that exist.

```bash bash 2>&1
grep '^function ' ./bash-logger
```
```
function log ()
function logger_date ()
function logify ()
function log_error() { log 1 "${1:-}"; }
function log_warn()  { log 2 "${1:-}"; }
function log_info()  { log 3 "${1:-}"; }
function log_debug() { log 4 "${1:-}"; }
function log_trace() { log 5 "${1:-}"; }
```

So what is this `logify` function? What it does is call the command and
arguments and write any stderr using the `LOGGER_TEMPLATE`

## Variables

```bash bash 2>&1
grep '^LOGGER_[A-Z]*=' ./bash-logger
```
```
LOGGER_FILE="${LOGGER_FILE:-/dev/null}";
LOGGER_LEVEL="${LOGGER_LEVEL:-3}";
LOGGER_TEMPLATE="${LOGGER_TEMPLATE:-%s[%s] %b\n}";
LOGGER_SILENT="${LOGGER_SILENT:-}"
```

You can write the log to a file by defining the `LOGGER_FILE`.

```bash bash 2>&1
source ./bash-logger; echo 'warn' | LOGGER_FILE="./bash-logger.log" log_info "info"
cat ./bash-logger.log
rm ./bash-logger.log # Cleaning up
```
```
2022-10-21T10:43:59+02:00[info] info
2022-10-21T10:43:59+02:00[info] info
```

How to use the `LOGGER_LEVEL`?

```bash bash 2>&1
source ./bash-logger; log_trace "trace"
```

Notice that trace is not printed. By default the `LOGGER_LEVEL` is set to
info(3) by default.

```bash bash 2>&1
source ./bash-logger; LOGGER_LEVEL=5 log_trace "trace"
```
```
2022-10-21T10:43:59+02:00[trace] trace
```

You can change the `LOGGER_TEMPLATE` if desired. The template is a printf
templates. See `man printf` for more information.

By default the `LOGGER_TEMPLATE` is the following.

```bash bash 2>&1
source ./bash-logger; echo "$LOGGER_TEMPLATE";
source ./bash-logger; printf "$LOGGER_TEMPLATE" '<datetime>' '<code>' '<message>'
```
```
%s[%s] %b\n
<datetime>[<code>] <message>
```

## Improvements

- Allow changing the date format.
- What License to give?

## License

TODO
