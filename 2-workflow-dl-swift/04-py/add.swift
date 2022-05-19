
/**
   Example 4 - ADD.SWIFT
*/

// Swift/T libraries:
import io;
import python;
import string;

(string v) test_python()
{
  v = python_persist(
----
print("Python works!")
v = 2+2
----,
"repr(v)");
}

v = test_python();
printf("v: %s", v);
