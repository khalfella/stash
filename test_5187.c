#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

static char     mkostemp_tmpl[] = "/tmp/tmpXXXXXX";
static char     mkostemps_tmpl[] = "/tmp/tmpXXXXXXsuff.tmp";

int
main(int argc, char **argv)
{

	int	mkostemp_fd, mkostemps_fd;
	mkostemp_fd = mkostemp64(mkostemp_tmpl, O_RDWR);

	if (mkostemp_fd == -1) {
		perror("error opening mkostemp_fd");
	} else {
		printf("mkostemp_fd openes %s\n", mkostemp_tmpl);
		close(mkostemp_fd);
	}

	mkostemps_fd = mkostemps(mkostemps_tmpl, 8, O_RDWR);
	if (mkostemps_fd == -1) {
		perror("error opening mkostemps_fd");
	} else {
		printf("mkostemps_fd openes %s\n", mkostemps_tmpl);
		close(mkostemps_fd);
	}

	return (0);
}
