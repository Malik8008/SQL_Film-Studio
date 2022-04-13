Create Database FILMSTUDIO

use FILMSTUDIO

CREATE TABLE [Films] (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Budget integer NOT NULL,
  CONSTRAINT [PK_FILMS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Genres] (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_GENRES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Sessions] (
	ID integer NOT NULL,
	SesionDate datetime NOT NULL,
  CONSTRAINT [PK_SESSIONS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Halls] (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_HALLS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Actors] (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_ACTORS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Tickets] (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Price integer NOT NULL,
	Customer_ID integer NOT NULL,
	Hall_ID integer NOT NULL,
	Film_ID integer NOT NULL,
	Session_ID integer NOT NULL,
  CONSTRAINT [PK_TICKETS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Customer] (
	ID integer NOT NULL,
	FullName varchar(255) NOT NULL,
  CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Film_Genre] (
	İD integer NOT NULL,
	Film_ID integer NOT NULL,
	Genre_ID integer NOT NULL,
  CONSTRAINT [PK_FILM_GENRE] PRIMARY KEY CLUSTERED
  (
  [İD] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Film_Actor] (
	ID integer NOT NULL,
	Film_ID integer NOT NULL,
	Actors_ID integer NOT NULL,
  CONSTRAINT [PK_FILM_ACTOR] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Sesion_Film] (
	ID integer NOT NULL,
	Film_ID integer NOT NULL,
	Session_ID integer NOT NULL,
  CONSTRAINT [PK_SESION_FILM] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO





ALTER TABLE [Tickets] WITH CHECK ADD CONSTRAINT [Tickets_fk0] FOREIGN KEY ([Customer_ID]) REFERENCES [Customer]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tickets] CHECK CONSTRAINT [Tickets_fk0]
GO
ALTER TABLE [Tickets] WITH CHECK ADD CONSTRAINT [Tickets_fk1] FOREIGN KEY ([Hall_ID]) REFERENCES [Halls]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tickets] CHECK CONSTRAINT [Tickets_fk1]
GO
ALTER TABLE [Tickets] WITH CHECK ADD CONSTRAINT [Tickets_fk2] FOREIGN KEY ([Film_ID]) REFERENCES [Films]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tickets] CHECK CONSTRAINT [Tickets_fk2]
GO
ALTER TABLE [Tickets] WITH CHECK ADD CONSTRAINT [Tickets_fk3] FOREIGN KEY ([Session_ID]) REFERENCES [Sessions]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Tickets] CHECK CONSTRAINT [Tickets_fk3]
GO


ALTER TABLE [Film_Genre] WITH CHECK ADD CONSTRAINT [Film_Genre_fk0] FOREIGN KEY ([Film_ID]) REFERENCES [Films]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Film_Genre] CHECK CONSTRAINT [Film_Genre_fk0]
GO
ALTER TABLE [Film_Genre] WITH CHECK ADD CONSTRAINT [Film_Genre_fk1] FOREIGN KEY ([Genre_ID]) REFERENCES [Genres]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Film_Genre] CHECK CONSTRAINT [Film_Genre_fk1]
GO

ALTER TABLE [Film_Actor] WITH CHECK ADD CONSTRAINT [Film_Actor_fk0] FOREIGN KEY ([Film_ID]) REFERENCES [Films]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Film_Actor] CHECK CONSTRAINT [Film_Actor_fk0]
GO
ALTER TABLE [Film_Actor] WITH CHECK ADD CONSTRAINT [Film_Actor_fk1] FOREIGN KEY ([Actors_ID]) REFERENCES [Actors]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Film_Actor] CHECK CONSTRAINT [Film_Actor_fk1]
GO

ALTER TABLE [Sesion_Film] WITH CHECK ADD CONSTRAINT [Sesion_Film_fk0] FOREIGN KEY ([Film_ID]) REFERENCES [Films]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Sesion_Film] CHECK CONSTRAINT [Sesion_Film_fk0]
GO
ALTER TABLE [Sesion_Film] WITH CHECK ADD CONSTRAINT [Sesion_Film_fk1] FOREIGN KEY ([Session_ID]) REFERENCES [Sessions]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Sesion_Film] CHECK CONSTRAINT [Sesion_Film_fk1]
GO


select t.ID,t.Name as Ticket_name,t.Price,hl.Name RoomName,s.SesionDate,f.Name Film_Name,cs.FullName from Tickets t
join Sessions s on t.Session_ID=s.ID
join Films f on t.Film_ID=f.ID
join Customer cs on t.Customer_ID=cs.ID
join Halls hl on t.Hall_ID=hl.ID

create view vw_TicketsAllInfoSL
as
select t.ID,t.Name as Ticket_name,t.Price,hl.Name RoomName,s.SesionDate,f.Name Film_Name,cs.FullName from Tickets t
join Sessions s on t.Session_ID=s.ID
join Films f on t.Film_ID=f.ID
join Customer cs on t.Customer_ID=cs.ID
join Halls hl on t.Hall_ID=hl.ID


select * from vw_TicketsAllInfoSL
