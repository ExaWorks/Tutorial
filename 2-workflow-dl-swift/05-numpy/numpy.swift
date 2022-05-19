
/**
   Example 5 - NUMPY.SWIFT
*/

// Swift/T libraries:
import io;
import python;
import string;

string numpy = "from numpy import *\n\n";
typedef matrix string;

(matrix A) eye(int n)
{
  command = "repr(eye(%i))" % n;
  matrix t = python_persist(numpy, command);
  A = replace_all(t, "\n", "", 0);
}

(matrix R) add(matrix A1, matrix A2)
{
  command = "repr(%s+%s)" % (A1, A2);
  matrix t = python_persist(numpy, command);
  R = replace_all(t, "\n", "", 0);
}

main
{
  matrix A1 = eye(3);
  matrix A2 = eye(3);
  matrix sum = add(A1, A2);
  printf("2*eye(3)=%s", sum);
}
