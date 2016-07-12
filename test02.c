#include <door.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stropts.h>


int
connect_to_ssh()
{
	int connfd;
	struct sockaddr_in servaddr;
	int ret;

	if ((connfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		return (-1);

	bzero(&servaddr, sizeof (servaddr));
	servaddr.sin_family = AF_INET;
	inet_pton(AF_INET, "192.168.174.1", &servaddr.sin_addr);
	servaddr.sin_port = htons(22);

	ret = connect(connfd, (struct sockaddr *)&servaddr, sizeof (servaddr));
	if (ret == 0)
		return (connfd);

	return (-1);
}


int
main() {
	int fd, i;

	if ((fd = connect_to_ssh()) == -1) {
		fprintf(stderr, "failed to connect to local SSH\n");
		return (1);
	}

	if (ioctl(fd, I_POP, 0) < 0) {
		fprintf(stderr, "Failed to pop off sockmod\n");
		return (1);
	}

	/* fork and sleep ten times */
/*	for (i = 0; i < 20; i++ ) {
		fork();
		sleep(1);
	}
*/
	return (0);
}
