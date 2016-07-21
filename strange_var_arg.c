#include <stdio.h>
#include <sys/varargs.h>


void
func(char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);

	vprintf(fmt, args);

	va_end(args);
}

int
main()
{
	func("I am here (%s)\n", "khalfella");
	return (0);
}
