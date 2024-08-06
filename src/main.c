/*********************************************************************************
*                              Author: Author Name                               *
*                  File Name: /home/aska/compta-csv/src/main.c                   *
*                     Creation Date: August 6, 2024 01:23 AM                     *
*                     Last Updated: August 6, 2024 01:28 AM                      *
*                               Source Language: c                               *
*                                                                                *
*                            --- Code Description ---                            *
*                                   Compta-CSV                                   *
*********************************************************************************/

#include "../libft_plus/libft.h"
#include <readline/readline.h>
#include <stdio.h>

typedef struct s_csv
{
	char	*mon_year;
	char	*day;
	char	*pay;
	int		flag_end;
}	t_csv;

int	main()
{
	t_csv	csv;
	FILE	*out_csv;

	title_screen("Compta CSV", YEL);
	title_screen("GENERATOR", HYEL);
	out_csv = fopen("out.csv", "a");
	if (out_csv == NULL)
		ft_exit(ERROR, 1, "Open or Create File");
	csv.flag_end = 0;
	csv.mon_year = readline("Enter the mounth and year. e.g. 07/2024 \nDate\t: ");
	if (csv.mon_year[0] == 0)
		ft_exit(ERROR, 1, "No Date");
	while(csv.flag_end == 0)
	{
		csv.day = readline("Enter the day. e.g. 04 \nDay\t: ");
		if (csv.day[0] == 0)
			break;
		csv.pay = readline("Enter the price. e.g. 150 \nPrice\t: ");
		if (csv.pay[0] == 0)
			break;
		printf(HGRN "%s/%s;%s\n" CRESET, csv.day,csv.mon_year,csv.pay);
		fprintf(out_csv, "%s/%s;%s\n" ,csv.day,csv.mon_year,csv.pay);
		free(csv.day);
		free(csv.pay);
	}
	fclose(out_csv);
	return 0;
}
