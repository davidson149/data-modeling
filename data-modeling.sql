CREATE TABLE "public.users" (
	"user_id" serial NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.groups" (
	"group_id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "groups_pk" PRIMARY KEY ("group_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.group_user_join" (
	"group_id" serial NOT NULL,
	"user_id" serial NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipes" (
	"recipes_id" serial NOT NULL,
	"title" TEXT NOT NULL,
	"image_url" TEXT NOT NULL,
	"content" TEXT NOT NULL,
	"timestamp" time with time zone NOT NULL,
	"user_id" int NOT NULL,
	"private" TEXT NOT NULL,
	"public" TEXT NOT NULL,
	CONSTRAINT "recipes_pk" PRIMARY KEY ("recipes_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions" (
	"occasions_id" serial NOT NULL,
	"timestamp" timestamp with time zone NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "occasions_pk" PRIMARY KEY ("occasions_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery" (
	"grocery_id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "grocery_pk" PRIMARY KEY ("grocery_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ingredients" (
	"ingredients_id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "ingredients_pk" PRIMARY KEY ("ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_ingredient_join" (
	"id" serial NOT NULL,
	"ingredients_id" serial NOT NULL,
	"grocery_id" serial NOT NULL,
	CONSTRAINT "grocery_ingredient_join_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ingredients_recipe_join" (
	"id" serial NOT NULL,
	"ingredients_id" serial NOT NULL,
	"recipes_id" serial NOT NULL,
	CONSTRAINT "ingredients_recipe_join_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions_recipes_join" (
	"id" serial NOT NULL,
	"occasions_id" int NOT NULL,
	"recipes_id" int NOT NULL,
	CONSTRAINT "occasions_recipes_join_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_occasions_join" (
	"id" serial NOT NULL,
	"grocery_id" serial NOT NULL,
	"occasions_id" serial NOT NULL,
	CONSTRAINT "grocery_occasions_join_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.groups_occasions_join" (
	"id" serial NOT NULL,
	"groups_id" serial NOT NULL,
	"occasions_id" serial NOT NULL,
	CONSTRAINT "groups_occasions_join_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "group_user_join" ADD CONSTRAINT "group_user_join_fk0" FOREIGN KEY ("group_id") REFERENCES "groups"("name");
ALTER TABLE "group_user_join" ADD CONSTRAINT "group_user_join_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");

ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");




ALTER TABLE "grocery_ingredient_join" ADD CONSTRAINT "grocery_ingredient_join_fk0" FOREIGN KEY ("ingredients_id") REFERENCES "ingredients"("ingredients_id");
ALTER TABLE "grocery_ingredient_join" ADD CONSTRAINT "grocery_ingredient_join_fk1" FOREIGN KEY ("grocery_id") REFERENCES "grocery"("grocery_id");

ALTER TABLE "ingredients_recipe_join" ADD CONSTRAINT "ingredients_recipe_join_fk0" FOREIGN KEY ("ingredients_id") REFERENCES "ingredients"("ingredients_id");
ALTER TABLE "ingredients_recipe_join" ADD CONSTRAINT "ingredients_recipe_join_fk1" FOREIGN KEY ("recipes_id") REFERENCES "recipes"("recipes_id");

ALTER TABLE "occasions_recipes_join" ADD CONSTRAINT "occasions_recipes_join_fk0" FOREIGN KEY ("occasions_id") REFERENCES "occasions"("occasions_id");
ALTER TABLE "occasions_recipes_join" ADD CONSTRAINT "occasions_recipes_join_fk1" FOREIGN KEY ("recipes_id") REFERENCES "recipes"("recipes_id");

ALTER TABLE "grocery_occasions_join" ADD CONSTRAINT "grocery_occasions_join_fk0" FOREIGN KEY ("grocery_id") REFERENCES "grocery"("grocery_id");
ALTER TABLE "grocery_occasions_join" ADD CONSTRAINT "grocery_occasions_join_fk1" FOREIGN KEY ("occasions_id") REFERENCES "occasions"("occasions_id");

ALTER TABLE "groups_occasions_join" ADD CONSTRAINT "groups_occasions_join_fk0" FOREIGN KEY ("groups_id") REFERENCES "groups"("group_id");
ALTER TABLE "groups_occasions_join" ADD CONSTRAINT "groups_occasions_join_fk1" FOREIGN KEY ("occasions_id") REFERENCES "occasions"("occasions_id");












