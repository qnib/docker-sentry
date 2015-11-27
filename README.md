# docker-sentry

QNIBTerminal sentry image

## Start it

To try it out just start the stack...

```
$ docker-compose up -d
```

And log in with `admin@admin.org` (password: `admin`).

## Hello World

To see how this works, I created a small python snippet.

```
$ cat example/python/test.py
import raven
import os

client = raven.Client(
    dsn=os.environ['SENTRY_DNS']

    # inform the client which parts of code are yours
    # include_paths=['my.app']
    # include_paths=[__name__.split('.', 1)[0]],

    # pass along the version of your application
    # release='1.0.0'
    # release=raven.fetch_package_version('my-app')
    # release=raven.fetch_git_sha(os.path.dirname(__file__)),
)

# capture a simple message
client.captureMessage('hello world!')

# Catch an exception
try:
    1 / 0
except ZeroDivisionError:
    client.captureException()
```

The `SENTRY_DNS` entry has to be changed according to the client key in the sentry server.

##### Click on the `Internal` project

![](pics/webui.png)

##### Go to `settings`

![](pics/internal.png)

##### Copy the `client key`

![](pics/client_key.png)

#### Change the script and fire it up

By exporting the key as `SENTRY_DNS`, it will be used within the little test script.

```
$ export SENTRY_DNS=http://7a6efbe582564567a4acb335ccf633d7:3fe3d21890dd4e7cba0535e6efc768f5@192.168.99.100:9000/1
$ python example/python/test.py
$
```
This turns out in the project just like fine:

![](pics/sentry_fail.png)
