# Logger

> Simple log functionality for bash

- Writes everyrhing to /dev/stderr.
- Colors and prepends log level.
- Ability to set LOG_LEVEL to not write less critical logs.

## Usage

Simply source the script and use the functions it defines.

### Functions

```
log_error <message>
log_warn <message>
log_info <message>
log_debug <message>
log_trace <message>
```

### Variables

You can configure some variables in order to make it fit your needs better.

```
LOG_LEVEL=${LOG_LEVEL:-5}
LOG_COLOR=${LOG_COLOR:-true}
LOG_TEMPLATE=${LOG_TEMPLATE:-'[%s]\t%b\n'}
LOG_TEMPLATE_COLOR=${LOG_TEMPLATE_COLOR:-'\033[%sm[%s]\e[0m\t%b\n'}
```

The templates are printf templates. See `man printf` for more information.

## Tests

Logger uses prove to run and report the tests in the `./t/` directory. See `man
prove`.
