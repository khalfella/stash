#include <stdio.h>
#include <sys/varargs.h>


void
func(char **str, char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);

	*str = "return result";
	printf(fmt, args);

	va_end(args);
}

int
main()
{
	char *ptr;
	func(&ptr, "I am here (%s)\n", "khalfella");
	return (0);
}
