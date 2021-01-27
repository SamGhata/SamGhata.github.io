# [Bootstrap](https://samghata.github.io/bootstrap)

## Python
This little snippet can be added to code for help troubleshooting runtime issues[^1]:
```python
import logging
import sys

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
```
[^1]: [via Stack Overflow](https://stackoverflow.com/questions/14058453/making-python-loggers-output-all-messages-to-stdout-in-addition-to-log-file)
