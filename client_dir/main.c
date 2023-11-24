/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jgotz <jgotz@student.42heilbronn.de>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/23 15:02:17 by jgotz             #+#    #+#             */
/*   Updated: 2023/11/24 11:43:29 by jgotz            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

void	send_char(int pid, char c)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		kill(pid, SIGUSR1 + !(c & (0x01 << bit++)));
		usleep(50);
	}
}

int	main(int argc, char **argv)
{
	int	i;

	i = 0;
	if (argc == 3)
	{
		while (argv[2][i] != '\0')
			send_char(ft_atoi(argv[1]), argv[2][i++]);
	}
	else
		ft_printf("Wrong number of arguments\n");
	return (0);
}
