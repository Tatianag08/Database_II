PGDMP                      }            Clase_BD    16.8    16.8 8    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16682    Clase_BD    DATABASE     p   CREATE DATABASE "Clase_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-CO';
    DROP DATABASE "Clase_BD";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            ^           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6                        3079    16773 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            _           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16783    comments    TABLE     �   CREATE TABLE public.comments (
    com_id integer NOT NULL,
    summary text NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tid integer,
    uid integer
);
    DROP TABLE public.comments;
       public         heap    postgres    false    6            �            1259    16789    comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false    216    6            `           0    0    comentarios_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comments.com_id;
          public          postgres    false    217            �            1259    16790    tags    TABLE     d   CREATE TABLE public.tags (
    tgid integer NOT NULL,
    tg_name character varying(50) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false    6            �            1259    16793    etiquetas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.etiquetas_id_seq;
       public          postgres    false    6    218            a           0    0    etiquetas_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.etiquetas_id_seq OWNED BY public.tags.tgid;
          public          postgres    false    219            �            1259    16794 
   priorities    TABLE     h   CREATE TABLE public.priorities (
    pid integer NOT NULL,
    p_name character varying(20) NOT NULL
);
    DROP TABLE public.priorities;
       public         heap    postgres    false    6            �            1259    16797    prioridades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prioridades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.prioridades_id_seq;
       public          postgres    false    220    6            b           0    0    prioridades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.prioridades_id_seq OWNED BY public.priorities.pid;
          public          postgres    false    221            �            1259    16798    tasks    TABLE     =  CREATE TABLE public.tasks (
    tid integer NOT NULL,
    title character varying(255) NOT NULL,
    summary text,
    status character varying(50) DEFAULT 'pendiente'::character varying,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    limit_date date,
    uid integer,
    pid integer
);
    DROP TABLE public.tasks;
       public         heap    postgres    false    6            �            1259    16805    tareas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tareas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tareas_id_seq;
       public          postgres    false    222    6            c           0    0    tareas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tareas_id_seq OWNED BY public.tasks.tid;
          public          postgres    false    223            �            1259    16867 	   task_high    VIEW     �   CREATE VIEW public.task_high AS
 SELECT t.tid,
    t.title,
    t.status,
    p.p_name AS prioridad
   FROM (public.tasks t
     JOIN public.priorities p ON ((t.pid = p.pid)))
  WHERE ((p.p_name)::text = 'alta'::text);
    DROP VIEW public.task_high;
       public          postgres    false    222    220    220    222    222    222    6            �            1259    16806 	   task_tags    TABLE     W   CREATE TABLE public.task_tags (
    tid integer NOT NULL,
    tgid integer NOT NULL
);
    DROP TABLE public.task_tags;
       public         heap    postgres    false    6            �            1259    16809    users    TABLE     �   CREATE TABLE public.users (
    uid integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    register_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false    6            �            1259    16813    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    6    225            d           0    0    usuarios_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.users.uid;
          public          postgres    false    226            �           2604    16814    comments com_id    DEFAULT     q   ALTER TABLE ONLY public.comments ALTER COLUMN com_id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);
 >   ALTER TABLE public.comments ALTER COLUMN com_id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16815    priorities pid    DEFAULT     p   ALTER TABLE ONLY public.priorities ALTER COLUMN pid SET DEFAULT nextval('public.prioridades_id_seq'::regclass);
 =   ALTER TABLE public.priorities ALTER COLUMN pid DROP DEFAULT;
       public          postgres    false    221    220            �           2604    16816 	   tags tgid    DEFAULT     i   ALTER TABLE ONLY public.tags ALTER COLUMN tgid SET DEFAULT nextval('public.etiquetas_id_seq'::regclass);
 8   ALTER TABLE public.tags ALTER COLUMN tgid DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16817 	   tasks tid    DEFAULT     f   ALTER TABLE ONLY public.tasks ALTER COLUMN tid SET DEFAULT nextval('public.tareas_id_seq'::regclass);
 8   ALTER TABLE public.tasks ALTER COLUMN tid DROP DEFAULT;
       public          postgres    false    223    222            �           2604    16818 	   users uid    DEFAULT     h   ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 8   ALTER TABLE public.users ALTER COLUMN uid DROP DEFAULT;
       public          postgres    false    226    225            M          0    16783    comments 
   TABLE DATA           C   COPY public.comments (com_id, summary, date, tid, uid) FROM stdin;
    public          postgres    false    216   ]>       Q          0    16794 
   priorities 
   TABLE DATA           1   COPY public.priorities (pid, p_name) FROM stdin;
    public          postgres    false    220   ?       O          0    16790    tags 
   TABLE DATA           -   COPY public.tags (tgid, tg_name) FROM stdin;
    public          postgres    false    218   P?       U          0    16806 	   task_tags 
   TABLE DATA           .   COPY public.task_tags (tid, tgid) FROM stdin;
    public          postgres    false    224   �?       S          0    16798    tasks 
   TABLE DATA           `   COPY public.tasks (tid, title, summary, status, created_date, limit_date, uid, pid) FROM stdin;
    public          postgres    false    222   �?       V          0    16809    users 
   TABLE DATA           @   COPY public.users (uid, name, email, register_date) FROM stdin;
    public          postgres    false    225   A       e           0    0    comentarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.comentarios_id_seq', 12, true);
          public          postgres    false    217            f           0    0    etiquetas_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.etiquetas_id_seq', 8, true);
          public          postgres    false    219            g           0    0    prioridades_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.prioridades_id_seq', 9, true);
          public          postgres    false    221            h           0    0    tareas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tareas_id_seq', 34, true);
          public          postgres    false    223            i           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 7, true);
          public          postgres    false    226            �           2606    16820    comments comentarios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (com_id);
 C   ALTER TABLE ONLY public.comments DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    216            �           2606    16822    tags etiquetas_nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT etiquetas_nombre_key UNIQUE (tg_name);
 C   ALTER TABLE ONLY public.tags DROP CONSTRAINT etiquetas_nombre_key;
       public            postgres    false    218            �           2606    16824    tags etiquetas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (tgid);
 =   ALTER TABLE ONLY public.tags DROP CONSTRAINT etiquetas_pkey;
       public            postgres    false    218            �           2606    16826 !   priorities prioridades_nombre_key 
   CONSTRAINT     ^   ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT prioridades_nombre_key UNIQUE (p_name);
 K   ALTER TABLE ONLY public.priorities DROP CONSTRAINT prioridades_nombre_key;
       public            postgres    false    220            �           2606    16828    priorities prioridades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT prioridades_pkey PRIMARY KEY (pid);
 E   ALTER TABLE ONLY public.priorities DROP CONSTRAINT prioridades_pkey;
       public            postgres    false    220            �           2606    16830    task_tags tareas_etiquetas_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT tareas_etiquetas_pkey PRIMARY KEY (tid, tgid);
 I   ALTER TABLE ONLY public.task_tags DROP CONSTRAINT tareas_etiquetas_pkey;
       public            postgres    false    224    224            �           2606    16832    tasks tareas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (tid);
 ;   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tareas_pkey;
       public            postgres    false    222            �           2606    16834    users usuarios_email_key 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    225            �           2606    16836    users usuarios_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (uid);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    225            �           2606    16837 "   comments comentarios_tarea_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comentarios_tarea_id_fkey FOREIGN KEY (tid) REFERENCES public.tasks(tid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.comments DROP CONSTRAINT comentarios_tarea_id_fkey;
       public          postgres    false    216    222    4784            �           2606    16842 $   comments comentarios_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (uid) REFERENCES public.users(uid) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.comments DROP CONSTRAINT comentarios_usuario_id_fkey;
       public          postgres    false    216    4790    225            �           2606    16847 +   task_tags tareas_etiquetas_etiqueta_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT tareas_etiquetas_etiqueta_id_fkey FOREIGN KEY (tgid) REFERENCES public.tags(tgid) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.task_tags DROP CONSTRAINT tareas_etiquetas_etiqueta_id_fkey;
       public          postgres    false    218    4778    224            �           2606    16852 (   task_tags tareas_etiquetas_tarea_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.task_tags
    ADD CONSTRAINT tareas_etiquetas_tarea_id_fkey FOREIGN KEY (tid) REFERENCES public.tasks(tid) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.task_tags DROP CONSTRAINT tareas_etiquetas_tarea_id_fkey;
       public          postgres    false    224    222    4784            �           2606    16857    tasks tareas_prioridad_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tareas_prioridad_id_fkey FOREIGN KEY (pid) REFERENCES public.priorities(pid);
 H   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tareas_prioridad_id_fkey;
       public          postgres    false    220    4782    222            �           2606    16862    tasks tareas_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tareas_usuario_id_fkey FOREIGN KEY (uid) REFERENCES public.users(uid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tareas_usuario_id_fkey;
       public          postgres    false    225    222    4790            M   �   x�}�M� F��)� ���/��m7TGK�� �b��{ W3����tPG={P�H'2�4yK��e]�r~��Z����j&8ܽ{Z3Ovt6z5��G�0)�'5�}�ot���&�OKN�_J�.Dm����@˄��h�k0�گ�vԼ�W�t�'=K����M      Q   #   x�3�LJ�J���MM�L��L�)I����� e��      O   8   x�3�,-JO�+I�2�,H-*��K��2�,)JLJ����,J-�,�<�9�+F��� �(�      U      x������ � �      S   Y  x���MN�0���)��E-��q�]��X�q�idɱ#'��P�Ћ1颪� �WoF��'y�'?�L����.��q��[?�ܣ<�D[�v�p�u�x��@�CN]�1ɥ^q�5���))t��#�IE�B���M�����}����Σ��1B^xCʓm-}�.���rN�cd���ӡ_�����SȚl��~�2�0������1��UDF
��p�0�R?X���W$j�.d���-A��O��C�=�fl��������p��N���ׅ��Jo\HM���`Q6�n�b�WZ�˂��åh�a��F�Wp��Օ.�������x-uY}�?��(��!+�      V   n   x�3�t�KT�/*J-�L�KtH�H�-�I�K���4202�50�5�T00�20�24ҳ063�0�2��)�,V8��(��3�&V�9�ob�ᵉ
>�7 ��&emm� �2h     