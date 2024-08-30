PGDMP  7                    |            crowdfunding_db    16.4    16.4     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24779    crowdfunding_db    DATABASE     �   CREATE DATABASE crowdfunding_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE crowdfunding_db;
                postgres    false            �            1259    24804    campaign    TABLE     �  CREATE TABLE public.campaign (
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name text NOT NULL,
    description text,
    goal numeric(10,2) NOT NULL,
    pledged numeric(10,2) DEFAULT 0.00,
    outcome character varying(20),
    backers_count integer DEFAULT 0,
    country character(2),
    currency character(3),
    launched_date date NOT NULL,
    end_date date NOT NULL,
    category_id character varying(10) NOT NULL,
    subcategory_id character varying(10) NOT NULL
);
    DROP TABLE public.campaign;
       public         heap    postgres    false            �            1259    24803    campaign_cf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.campaign_cf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.campaign_cf_id_seq;
       public          postgres    false    220                       0    0    campaign_cf_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.campaign_cf_id_seq OWNED BY public.campaign.cf_id;
          public          postgres    false    219            �            1259    24789    category    TABLE        CREATE TABLE public.category (
    category_id character varying(10) NOT NULL,
    category character varying(100) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24781    contacts    TABLE     �   CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL
);
    DROP TABLE public.contacts;
       public         heap    postgres    false            �            1259    24780    contacts_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.contacts_contact_id_seq;
       public          postgres    false    216                       0    0    contacts_contact_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts.contact_id;
          public          postgres    false    215            �            1259    24796    subcategory    TABLE     �   CREATE TABLE public.subcategory (
    subcategory_id character varying(10) NOT NULL,
    subcategory character varying(100) NOT NULL
);
    DROP TABLE public.subcategory;
       public         heap    postgres    false            ^           2604    24807    campaign cf_id    DEFAULT     p   ALTER TABLE ONLY public.campaign ALTER COLUMN cf_id SET DEFAULT nextval('public.campaign_cf_id_seq'::regclass);
 =   ALTER TABLE public.campaign ALTER COLUMN cf_id DROP DEFAULT;
       public          postgres    false    219    220    220            ]           2604    24784    contacts contact_id    DEFAULT     z   ALTER TABLE ONLY public.contacts ALTER COLUMN contact_id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);
 B   ALTER TABLE public.contacts ALTER COLUMN contact_id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    24804    campaign 
   TABLE DATA           �   COPY public.campaign (cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launched_date, end_date, category_id, subcategory_id) FROM stdin;
    public          postgres    false    220   $                 0    24789    category 
   TABLE DATA           9   COPY public.category (category_id, category) FROM stdin;
    public          postgres    false    217   ��                 0    24781    contacts 
   TABLE DATA           L   COPY public.contacts (contact_id, first_name, last_name, email) FROM stdin;
    public          postgres    false    216   i�                 0    24796    subcategory 
   TABLE DATA           B   COPY public.subcategory (subcategory_id, subcategory) FROM stdin;
    public          postgres    false    218   �                 0    0    campaign_cf_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.campaign_cf_id_seq', 1, false);
          public          postgres    false    219                       0    0    contacts_contact_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.contacts_contact_id_seq', 1, false);
          public          postgres    false    215            n           2606    24813    campaign campaign_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_pkey PRIMARY KEY (cf_id);
 @   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_pkey;
       public            postgres    false    220            f           2606    24795    category category_category_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_key UNIQUE (category);
 H   ALTER TABLE ONLY public.category DROP CONSTRAINT category_category_key;
       public            postgres    false    217            h           2606    24793    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    217            b           2606    24788    contacts contacts_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_email_key;
       public            postgres    false    216            d           2606    24786    contacts contacts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            postgres    false    216            j           2606    24800    subcategory subcategory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id);
 F   ALTER TABLE ONLY public.subcategory DROP CONSTRAINT subcategory_pkey;
       public            postgres    false    218            l           2606    24802 '   subcategory subcategory_subcategory_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_subcategory_key UNIQUE (subcategory);
 Q   ALTER TABLE ONLY public.subcategory DROP CONSTRAINT subcategory_subcategory_key;
       public            postgres    false    218            o           2606    24819 "   campaign campaign_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 L   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_category_id_fkey;
       public          postgres    false    217    4712    220            p           2606    24814 !   campaign campaign_contact_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(contact_id);
 K   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_contact_id_fkey;
       public          postgres    false    4708    216    220            q           2606    24824 %   campaign campaign_subcategory_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategory(subcategory_id);
 O   ALTER TABLE ONLY public.campaign DROP CONSTRAINT campaign_subcategory_id_fkey;
       public          postgres    false    218    4714    220                  x����vG�&||
< �����K."Y%R�*���� ��D&R�ӏ����I��:��R�p��[�v��V/���������v�<]��۫�7_��~�pX6���i�m�:-��v><]O�����i�!1���8�}������s�׫A�r܌r#�QlF��p3��p<���LX)�~�]��������n�����N��f��/W���~{ZnN��2��Ɔ?�77��������|��J?Rl�I4�G��2�t�LLBZLnx��N+����v�|x��ӏ��y�����|���-��vx�\=�7�gx)�sz�q*O'�T��������ގ������Ոϧ��gR;h�����v�ç��z��̻�Gx��8��=�㭇��?�~9,����~���w���v��r�L��|R;G>���{�>�Q�+�Glߛ�&��û� ok�n{:�81�|�˗����3<��qp6�T#�!?�(�S�ۈ?�ִ�
�N?U?��q��f�·��x�~���������f�Z�>l�};�f�b�G%������կ�_�� ���׃�&?�������u�<��ߞn���_5����w�)��a�㑹�ww�N���3���1o^��>���6J��+��1�i�3i�����r>��ܼ9���^�)8̻����r�G���w����M>�N�:�t�uH���i_�zPr��������~���8�����~�|:mO�ۥ�->�~9B�)v�A�������Ʃy�Qç(�C��3xgJ�i�8�/���z��N1�����v/��e7��%�'�%t{�0� 6�G!��>�J�_0Z=�9,�����vx��'8��WB���$��|�x�P���16N9���'�=�U���a9,p,��ޗ���~9�����氮��Տ�^ͷ��"Wx�����<\��x;X��ʨ�����<�T��n�e���M�įۇ�N��p;�ׇ�r����%�!�Dc��´b�N?΅g��	�����k�}]�W�O���C������ݜ�~���a	�}�A�/��].������JoB�ˠ�c�$7��8v�����	B����i�0q^��Ķ�t|�Ow�4�)?�45���6l���v<'�9�h�`{3�q��rޟR����=A��{�nn0�lo.�8ș�pLZhzg��r�)�MX���3!5<���N�1����g�G8!�?ҙ���o�G�p��kc�{����ex6��3i�tJ	���zsgp����i����a�>��-��6����z��V��.)�o�S���5��%�A�%�V�g�3P�@ݒ����z�ݒ �_��c�>��)v�q
��f��,!�(Ӿ��󉐎�T	'S���бy���j�1���b@t�ҔȠ���uD��E. hꀐ���qY�-G�����c�Y9��4W7�X�p9!����bF�J2�������裇=�v|�><������_w��>B�b� �l?�����=�}�V��6�BBXWb8(��@X;�R�^����_���~�A~��G����rx�]��T����Wa��l��������m�}���_�>]�;�c-)��}�Kj�O s&��9��j?(q�����Wmw�T�� ���_c9<,�[�*���e�2��#�ێ�V�T�Av%������	�m|l������s��?��9���	I��><��x�=A��3��di��,��G<��c	5���BB�iDJ#�O��n��{�9:)g@���7\�����n}�w�'x!.=���G��CO#�i9��G��@v��I/�#|(�A�}��|�c�p��	��MO���K}�L�EO3�`�K��#
���W���}9?<~���Wx�+~�����;|�g�}��8�ǯ8>!��9�@�x0���\�jZa-
$Ljp�S0���0�	O�v~��
�6	;���x�����������-��u�L�J��T�����0���I6/���BC|<��Q,=���Fkӧ7�ϫ���L_�d7x��3AU7>�r�kA�wpT��_��]��T�6�dxd��M{%A}Hu�]!��CX��W޽~9ܭ�j�-��B�~�䬳����?�_���PY+�X�^M`b���n�B㸃�+�н�|BZ�z��#f���[.��<�-|{o4F�|LG�e�e��[��=D5���k,E!p@�������.�
�&�^�C2���v�X�Z
���Lh�s]��S(��I%��U!Kp�&+y#%��v2�_[�(M[�Qi,&D>&�w���D���?@����)�ݡ�]]j���9!Q�:%�$��|��z~x��{�����P�RY�%W��KW�;��m&�M)����g!�����X��T�Q��l�8
����P4��Q6��|����aT~��sW�u�v��q��˔�����W�%������C��톶P�u>EU�Ht�5M��е:3���G[����U�l���÷y��<�g,����9}����������Oi�N���Ԗ$J@7e��>�t�c���C��_�4�l���n�=����]]�TLb�8������i�k9�9<������p:�#���P�ł,W���~�$��֢C�yh�Cԅ@��H&��i�:���\/����:����|�o�w��r��%x9h��ݻ�����ϼ���Coo7�onλ�z��OCX��xݧ���X��"���t��o�]4��y9���p����rf���o���
U�m�C�x���O�ch"��|���-�i&;���(��M`��*]���� !W��$��=-{����R)bB��?���>'C���IĶ�H�����6�����~9��^������ĕ߉��I�l�*1��>����8�f;��
��ӠTΟ����-�Q��T�	z�	����>m~�O�4|�.:���u�=���ٖs���
�ñd��D��R�"�#(��&�������RlƉ�N�����ܜ1��'/�$������T��؜�		�4�zx�x?��M��+(]����_�ؓ�O^q��ob�ߘ�/���@���v<�K*�ɷQ�L5�[��q䗦񪄻�]�� ���7���q݄'N5������PC���ı��/<G>�%]Iex�)Ƕ��Z����a�+�O���)��q5\�]�+�qc���6U�F��\ȑ�5�`�٠�F���cO�ׯ���Nt��/����/��M�W�A�r�T����ĉ]Z�Ǣ{�9����-B54���w�=<NjS9�����
����i���9.������~��a:��0�bW�z����Q՗&��N	>��˴����a)�.(��&��&��/S�e�Ej�{S���q0E�#v��y�%�&,�kz���Zni���Li�
ՅX�E�2x�i�F'�hYN����<��zlv�8�!֕������S�f�����Tc��^���o�E@L?����bI,K���6C�y������cW��bJW��v �H�#��u�v���+t�vi˄C����gQޗ�V;Ӭ��Q�i��0%��&8�
gA��[l�Z�'�l�M[�p�8|A�IG��YO=m��͠P=�3>�AHEX>�_�	�	C���no�ÿ�k����1�Ca����Х�
y҇N�@�z�A! �3ԄF`�ޅ� ^IY���St����5���-qVa�b9�6/�'�K��C���|����b�׳|���)�UB�~^���|���i�b�'���ΛH�Õ�t�d��FS~��? ��p
���~0ԁ,�C}����4�N��2y~��1|�5���%=��{u8�e�n�8c�V��1T�kiW꟱[KkKJ�� k��b�d��Xn�[ń��;yB]z����q%���bz
*uL����ꠀ=�u� V��CX��2G���5�`Yr����{hVL�&O�(%�1IB��)��?�׃��`����K��~�{P���3    �V�����BVO�ww�+k"�
Bk,4LFo�� z
3��y����pxb+�z��!�Q�q7��2zt�f�'�3a�1�C��n�@G�+������
Ű�
ؚ�Q��ڗ�M�:S*/�p�&�j��=n���q�5���U�q�ڃJ�S;ǋ�ɴ/[j�2�'m�����B�4O+��[�����T,�槈XH@����f�f�\W;v���YG�B�j�f@�wr��6S���@���F�6�L� ����hZ(;��!۔.����A�~���s�3(4���"��L8��E��<p��V�6Pp6��{�m��y���h�8a�۷��"���ˊT�nO�T�b�b�N��4��������w�P�q�BY��o'���r��rS�,��zs)�i����O"��b�	�#��O�S/�}Jc�?�7f�n�y�!��z��X�1ޖ��.�ڱ��\�7�~�(k��G����v�D:�e�7Ox0S��nc��F!f^Pt;�����k��-P.�w
������]%��R�z�5o��&��$��#�J�[��j��������m��!v�;���+�oB4��b��O���u>�O�Љ��-D�	u8��!@��͋�ᄋ�������S�N+���ۯ ��/�Q�*=���|�\�jr)��������V��-n�����%�k���-,��ZDXnh���HHd��d���لk&8�w!��L)V8'3�ͫ/��C,3�A^(�����W�X�F��@�k��?ٵ��'!~��L�Q7VS�s����,S�% ��iXZe�Z��_f��	�"+��A��]�-�Q���ѣ�>dN�����S:"�{� �w@��k�_K����&3�����X�i!�W���R��	c�fɑ+���\�6����C�q�G��a���>�Ì�k<&�8R�e��0:���W�g��m�P/m���g���
 ���z�������t;���V
���]����9~q��(F�J�`��
��鵡��0����1OS��"��3���
6��eW������9 |�������,[h~�<G7�iRK�O��T[=�p�ͨ5~��?B��	�*��|���-���=��SE���*`@���B����(��!˧�aK�l��i�b�۸��Y]:9<�P%�nx		�����9(��[z����4��f hi��=?lg�aȑx8B�]\��a�MC.w�7�)���1YG�y�B��6������Č��y�{�����;�Ij�,�����m;�Gd7v�r�"�zb	Z���?���nfx�PjA����?�G��ёSL�x8���|g"���!F�5�7��|��G��m2�-��o u��1�BPx}���S4&�)�^ɋo�X��u�9�P��?���i!k�����BV�f���yW�cy�e�W[e�ib�?(6=�8p�l�p]_�?:��ҽ�_�f#M'
���h{��'W)�&Nϴ��x����.�&�s�X�0.
c_���n)���DcM�cG	k�W��ۈ�<����P;����e>���psޞʤ���앨&�2��7X\E�KP����loٰR�
����)32���dy1<V����Y��b�^-7yBX�4���"�xv�#L��HS��%�����Y@a�pTw)��h*�����~�G, [�b�%�cwR*W��]K�C@B1~� 8A
Y7pV������Χf��s�3�z�8�:C�%�K^	zb:��d֠=2�N�������F�s��Gw�`/�K]�m%j�9����i��~��F�-������r��1�ʊ�:6��.1�
ᦅ��"ob�{fÍ2���n~*�D�����jRr��\�-�b�?�~dh]��~>O$��A���3���Ѥ�bi�z��c�fG���Y�2ڭ
^�#��2Z[�j����!oe������iR|��W���@�^�f0�U�NV8��/�s r��*��i�j���#�8�Cu�|I�r���� ���b�9ɒ�I,�}�`�B�m�Ή!S��#�1bZ��,{�q��ѵ���t՟u]�74��tp��:�L�័���6�FL�~9�����T9�A4�q�1rn��4�8�.ws��+�l�3�ϙԕ�u3Q71T��+�8�˅��>8�ypgp����^_���_V�.�Έw����+�!G6Y�u�p��_�8*��W@��-m	N�6���p��KhT�i.��x�(?[��N.����P��r��1���"�p��ӹ) 04p#����1��d*G��p����c[F�-�.�, �T�*[ �y�M�
���PD���k! �B����z��U�Aܼ������Y�����
Y��!��t�ȧ��ϐ2�0���Q�[A��X;�j�TXGx#�mz�d�V ,"pF��^����oJf���4K��L�8�_�H��(����3<�q�pJ��3d�47�Ƽh�&N����(�����;��q@O���x��/�`2J��+\�Ǽp�3�vJ���e�
�+j���;����b���o
J'��똠#��Z��X��K5L�"
�Za�_�_������x�o�̮x�����3��L�ߐ-u����r$.�Q���*==a�=��*k&�h겺�#�K;5)� �z��Xs_ �h����rLa:~�vW���|s"�L�39#?;Jg-� ��*�����_��?�Y��׾��/{=�an�(�?N,A×�w���qa9^�/�fx�/ 9�4Ѧ��s�0�y!X�")���v�*X!Į&�vz�z��D�}��*XK� ��n\^C����4�����֙Of��S �y���ai�R��8�a�#AZC	8�]/��\���� ]�9l#^���r����Vri�SQo����� MBc�v~�F��j��v�����F��G�a�\�y��(�����iP�X���=��M�/T:�B[�s�u<����P�{��C�.!�B�ʹ�w�ҹn���y	�w?H��eD9��U
-�)��X:A�H���ZO���xWQ�q��(��t���jp����v7'��r:����ӥe5�2��&��C}���Ɖ�9�P�+М�s��1�MmU�9~�fnV����#d�,��YNА\U��.;��#�#n�@����t�K�٩�ݢp�;�-R�%m��ڼYw��of�gx+߷����C�m^ �1��Stua�V��>V�#���!�d^��������="�p����3���q��E!���56�*�hF(����$%���EBmcy@'}��xg��p2> ����w�u�CgH�7�E��i~��������d�)���HU�>;a�g���|@&Te�%�f�:��NH�.ԥ6�p�F�3pu�@����G�QMf�l���T�YUY�6j�¢T����}f5�������YD.��v-z�m�*V�a�p�t�$8�,��ڑ8�؃" �+�l8���|K��o�w�Y<N^���bˏ�7m׍�:n������X�A�]��Ұ�ȞjiU]�掣m��v���].	Dv�4�'�|B���4�RDU"�
<}?��������(��bN����c�|\�R�	���y��bHs�2dLZ�E���[���,թ���()���&�o��BVwE�P6'A�]�n����"��	�P����*��U�Ws�����0-x����ᡰ�1�;L2�+�[�<o/ J�LV�u��O]�!i�σ,��#ס��x���<�$uy�0rGP���B[��g�T[x={A�\C�1�|����VQd�ti���\���<)�Z�3� V}�a�g�_��Z~����G�q��nGRM�z���\f�x�u��eS���0�,�I����2t��kEZE�i*B�HY��y�����`@��J��No�EN!�V�U&�l�Uz$H"9����UF+�E���U��dx3���r=ܮ�b[@ �9k䩅s��t�Ì��    �#\IW��+H�q��缿�waX��kYV���Z_$�t��!��d��
����g�v��Y8���hg7tQhF�ԋQ�a`!�hc�}8�XBrNW�F�<ަ<7h r�E��ƴ⟆����#h�$�`�F��5
)Bޡ�\�
�=���8��D�<B��$z^&[Ba����v�/�O5�̄�錐�#���v��z�2��=��>�P�.�Y����'[�$/v%8�&z�W�ʂ�P�sݲd/���HZ��2�D�Fq���!,�5�m�Ny�����,Β��i)[DvH���"��x��D���6a(럱�|���_�X�5Um���������U��i$(Z�,��}�"���Y3N�nzS�ʒ�hDZ�,��B�~�cn�P(��Ca���&�Χv��@�-y}�X¢{ �!���e��a�q��UPy?-��MJ`vlX=�ZTTܨ�ٙ�
j	TR��h���0��s	U������I�|�Fd�|1$%��qB���"��Y=E���UP�oD��y�Չ����Ӹ?��v�zy�EX6oi���]ѧ��i��=վ�(����F��د��m����{�ɼ�,I��Kt�d0����L��?�jx5���HD{�xB�-jIZ�@��r�]d�f&:K��RP�5�[���D
藔*.̼ �+�i�:1=���U�FB_��0�Z7F�QD��r8E����v?7a���a���8�5�6Uz>e$}]�m���@�o,�6i$/@���������Q�4h�QU�Z���Կ(�.�kv�݌P�^�Btt����_{��J�	6�;��:YaI4�8�:`Q�O�5u��`�Snr��M��UJ
��e�0D*°�&����u��H���T��(�*�+�P��^�n*![��C.d0�:�+����uFr� ��G�9����	fj��UBm���u�������Ӳ�<�'QZ���s&��E�nIup0�2�ސp�~��/��Op�w���S��C���D����;=a5Z�A$�d�(�S*`ҧϏG��x�!�f�:Y!���!�_98��V��5���@�m}�r����un�&#Zǌ��Q�%�k��|��a�}w��]^��36��MB0i�Rc3޲����2e�X�
�٨�h��%U%ie!��gN���q�S=��0����0�"���_�t5���ߠ֎��L
KƉ��k�3I �-.�B	�
��Nï�;��T�����ap ��l�UBZ�����E�N������x�h�Tv��H%�Iߕ�Fn�F��dW4a��ީ�Y���I}���y�9V���} �P������<gu�L�Ux3�mu�2E�6���KP	To$d8�c2Ë%�PH4N��,���H�Q��E�:V��*$��~��������K28_�"���o>�d����*��:f0N"qUt�j�i���ɺ����=n7I�^�Ҭ5�e���J��T�ب���\"`�Io�[l >�D\\�I"�\�������v9~�7RTd��H韜�]�Y7o�0��l�F�9xiB�@�r�*Mcۡ;n=m|Dб�i��_��Yv��狐8��N�^Q�TD��[ñ,y�-�u�sx��=���1�<��&�&���P��[(͑���CѬӆ�*�B$A�g�����r�h�z-;;��,x"�T۠U��&K[Q��g=%��E������,��t콰F"P� ��pr=��]�4\J>��Z�uY�]�Fvl�����S����;��Q�r��o�&93�[TB$j��
�(�s��	� �Sl=א�X'��
Ð����pP��(YL�z�
��:�m��\�춄/��s�K_EdT��ڬ�جOR�s/焤tT�K �x ��3��ӊ̨����HmAm��6BK�%��Bqa��_�C�+��{�6�HM�gu�S�85���uG�zQ	E�F��?gx%8���I�3�;uW��:f_f!@KJ��������ī0oU%r�[�
��ۙK�iJ(�f�+O�e�+z�t�QxN����9�f����oph�*@��0�Ȁ�׹����+�+:Zk�p�'���O��`��y��4
�e�_��Pזg�k�֒.ZK����s�	*�y����~�4�4�.1v�(�?�"f���
��߿/{䪔�Nl�
m>��4������E�^�݀�.{@A�=�x�ƫ�B����Wi`���z�L�IZ/��`�L��+q�)��T�T��.����WS��0əc",�p]a�����y:_�]!���2aFL��erz�j���P��Irû�x
J
A:;y��
�`�t�̃�}�0|�  Q��a�|x#�?�Pf����������.`�㲁�xi6ic��$+�y[
EkW閎,3�j�v؀Xa��A�u���Nʞ���W�/���4�g�x�:
��!��_p"�~��|�0��ĎE�D����Y��@&E�Ό�P\.�> �*��?L���
U�����+���Tw�l�A��El�у��&�ӉC -(hu9�	i�y��th��$�枔�h�qx�E����H＿�M�}s@�ͻ�o����f`c?T�*��{�!��:+�M�]�`�N(�s�����K;���U���Eu_�j
+3�rQC�p��B�I�%�T����^�oC�n9�����:n�px�=o��p����e�=�T)���v����*<?�~
��vH^ ����a*z��!ۡA���+���l]=傆*�{��"�����LDK^��dH��5/��������� `h�颰���2�P6/�ϟ[M��>9Q�u##@\�V�s�/H	�����7%�m}\6u�^G��j/5�"5��v֣*xu%�F4T�_#�'�W%��
^\蟉�h#�s���kr�kj��ry7���3&�$SMVQ���פy�D��狠jt)2C�A���s:��%�\ <�#�D�T�P~��KsLݵ�	p	<�C��v��Yɩ�iꦴ��٢C蠐��?�Ͳ3K`�4"k��mQ(2>MvQ���"f{�����?��d8ҥ���t׳��r	���`��_�,�t�!�%WzՍ.W!�U�ͽ�po~w��C�aS�1d:����QW����ѣQQ�@��x>��n�-�?^x�9�l����Mw�\�=%tR�5��Ñ����_� ��|2�+������"�v3�E]ز�W��+�B�0Q�ID"W,��Mj�l�h�U�����[+M�F�fRm؈�!
��/�3�;�vB[9?b�pUb�\�����)Q3G��ld���8h�w7���_#/<����~[�׭�N�vZA�B�(���s��$_*Lp(��/�e���i�K?;���@Qy��QU�4�&��M*�#�y�p�t�#�q� �Yd	%C��~SП�
�/+�K�??#�S��>rI�|��O�'�{�Y?�/���t�Eם<ߒ9�8�F�N@y�W~c�(�6H�P4N2Q��)uu�.y0](
u� tK�������H�Q;��#�\����}��w�ntJ#���u=r���[��U�� ��qJȀM��E���O���3��0���xd�.��X�"� �sa��j�!�����eV@N=��W�,��!���]�+�3g�%O
�(���Hz��}1�yބL1��MT���Kɰ��p�}���4�O������u��:oO�Z)�%��ȴ�H��'ca[U�:ul��vM;� �X��qr�8z�J�2����)3� |�4rk.5չ��`	;'d���~E[�ۧ�\��k/q�rږ����3i�z#ܱ.�*�52��W
K�)���i���E�c�Rf��s�ky�cB�{a��W�[��7y=�s��'�� )�������a�=q���ί����4�ل�[|���2Zt�Gŋ̩�;��m�(��8�r�ECEɓ�GT�(�n~l��b��Sўi�&i����P��.�>��K�`��)$�~���~�(4�^!$�������ׅr�W����y97�w�G�2(�P��sCMmP���rl?}    �;]h��B���4�	Sq���V�S:���i������kQ��)/��.�)\����3QM�&ߢ@���y����xx�������f�x�ꭀ`�)z�>jq�A�㾐O4<���C��D���j�n��Q��l8�Eu-�ɻU�ݲF���. fr`ڞ�2j}3OE�"eǾ�Sq�&
�+>h���������} �^��UoBz�si9��l��C��g
Q(��T����D�OY>��z�k�pu��d����A�R�&	�(bS�{��1%s6�M*dńtV4�4U>�+�I%�1M!����1�Mq�m�H�������,N�!�����i�*?��λ�������=sr�r���r�	Q+T��?e�tR���P���R�smW]�����.�@s������cm�l�	���vd��\�p�gUM��U�G`�unxu��.Y1B��\!H[�VP$�l/G˚�a���5�T>��M�*s�u���W�y�������3�Z���F�y�FR��3D���s���a�y"�[�b�|ϙĒ�L1kb��ġ����TT��Z�0MU�蔍���^�sY9A-�*8��<�پ��56�]X��\��(M�Pf�������?���<�;o�C�Z(y�I�\E�>KΥ����tQÕmp6Ck��pw�k#�_&LU6�(X%;����4#Ԉ�iQM��F�|�H�V�����|���n���]ᣴ���%�w뷅��P�V'�G�(e�ɾ���)�hj{)���g����d� ����oq���op*q�-��kL/���
�J>� ��-4�-��4�t�,��T���������WT�Eo��{���*B�t(Ӄ��o�MT�D��i���bo���3,�5Q���4�#�s�'�?�tR[㪍Yx2��*c�P�xX/X)29T0TO��46	�??��ԍ��7��GM��bTL���u��A
&#p�<�k��Q����n����V`���}|r��B���H��t����1c���-�{z#+���6˾(��k�n3Z*'�
(4KWhi���F.flxr(Z'�"�_x�nj�ȣ��,l:�,�)`�K���&�Iu� �m�;�;'�2{,�D�%)��|J,��aRѯr�QY:�>��E�}���-r<�5�C�h��Ok�ڤ���"#׼y�
cʧ�L�(�l�+�Z�w�8�릳\�5��d�t�=��NhZ��A��	a��dg��Z�o��Vݎq�* *�
|��H�A�	���L�H��P����z�?�LMF?Cjp&��zC;]	���ȕ#��p�Gh��&�C+]V��F(��ж�N�+"GRC�	�B�;¿���㲏�h�F�J:YBx{��´$@w>���8h����a�$Ub��V�����f=�5\�j�"��ݼZQٸ83�Ѫ~�r��PDu�1�s�9���"�aG΍��}Rɧ1D�f���L�u2q��Vװ�i܂�)ˤFX^��؊��	g٭�qj�y.��(�S2�M��[	�ş|	d������J�g�$o�˼�LM�ݩhH���8�V^)>�`]����{�@��M�38���ð�s^ԄM��8Dc�(�UJe�l2-	j'��y�tҌ0y�O�Ǻcmx���o���y��N������AJ��F[�!�P#Φ��M�&	��a�,3�j�+�y�0R�`��!!�(�P��UTP��
%%��J���4��6r�:��ʦs�P��=�ǗtN{�t��\�%��rn��� WS�*�RG���\
��|�$O�e�f��[x�"��� |�&72H[��\�M)�������н*�p<��R�mo}
��kw�lV{�K�Y�LB[�����b���A�c��{z�E�B�Vb�[S/�\��'t�BBi�u6�1�d0[�O��8�n4��k�RϨX��A��;C}]}3N;��ӱ�7\�"W$m��,�[�0 Jc��F�D�PE�·N��׈�`_v|�c��?Ȃփ��u��0������J�S�1�����JT�D��wqHM!jΘҳH�r�mIi"���,"�һ����%���猠
f/դ���uh:u�*m��s@'g%A����!������C9�M�3:C-zm�E�%y�Ѝ(�DU<�w�'�6�}n}��M!'�<��pur����;+`K�wA�axM��m�[�BU|��ֳ�SsE�R9!�i�*���U�0�l"F�B��YO�a�S!.B�y�������*�Cօ_�EUr�� ���L|n�%bs�Z��-Tiq<�l�$��M��y�.6���*�4����@��c2�����l��w�0/P#u�6���o3!�%t_&�~�ս�l'���<�M"�����T���z�+�(U�Bo|�g{�*������xhק��E�J48��ؔ&EmJ���.�`�6Ca��SF�4ˍ��-��	Gp�$��a����e��TZtbeRP�R�~��m����Nyd�t��HZb��z������!�Bh�:��l�蒒��	�+Rǚ���&� ��v�.$h�2+�<�#+�O�����u���*z�
NF&e��
��U��bVÚ��:���4���- l/pIםa>1U�I��f�'y%^ۂ���ܡ{���<�l�$ׁC������1b��ӗ.��<"�Js:B�m��͞GVԗ�&��Ԡ�uË�i�F�>iS�r|���3���w*5�*�q�k�̦[��
��|5���"a._M������	菌���K�U\�n��� #6ǓH��#<LԆ�]kR���7�\�BVm_���'��D�H^:xy�Q*������i�I:�Ǝ��M��,��ĆSJ�I�;�"o�L�i�4�e�����]^��=��> 8��M����7������`���h�ݴ�N^	
:�
C��azRҬNj���*hh���w�\�ع�D�4DpVr���l�h{�9�p$=�Ү���=1��*��6e�o��Z���C0�,�Q���5C0z_X}6�<_����"��|+�X�J�!Q�/ՐdJ��ߺ�S��Dn��,g|�	<g����^O�6o� ��p��_������_�fV!�#3@ZmS��:�@_��Q6W8�v8d({د��ȇ%F��1
__��>��j��ܤ�~'/|�!�4���Uf�@"�śV�mĹ����ԉ��Z����x�r��/�;���*�P0IL�a�Z;`�M��R��K8�u�S��'^�0�tWn(ʁ���MVn'UBa���tV2�4F}��惔�C(��*\������,�Qw!�T��Cȗ��I��cK�(!r0dc�J�z����dƘ,�_)��5��J����1�Haj�k?��Q����?6��NC��g�����h�!���	1��!��L�Ty��~�_�0A��r{̋n���b��{Ssn�Ml�aq�x�ݰ2V�-�6��gt=	R��X��j%���n=9F�".I����A�]Lc�r��Bi��S�&T����2���;\ΦS��7Ϯ�#�n�~�z-W�,�S���W(S<?k�^��Yb�G�q����:���f����4���H�`<:�|)�J����=O�>�6R�T�f�U(=}M�[5rk�df�b�C��	�	�]&���d�_��8*�i�{x)	��:����{�����-�c�U�F�Z�?���ֻ��*�@Ld��#UB������\�����59��;a�O��S4m����dw�B�����pOx�&���*�\�u��r��6oW���B(����OUlik���B��8�O����u�%
"kl�?A%�#�s�Ԑ��(ĭ�G
7��0`P�c�	�w���n�~�=�䂏�݉D_�ɗ�٤=)���f9��G�1�?U��Â�J��Tb�J�cf�U��E�Φ� �%�H����0&	ܴ$0D,���4��d!X-}�<���D�+a�0|\�2~re�I����e���Og ��ށ�A�_a��n����(P��j��!)�v�%&:ѥ#    �S�ɣH�HJ꭫@���%�*�5�c�
�v�~��et�&,����n��18q�����G�i�K�,ԧ2WAf�n�t�8�:�p�(�&o��P��4Kt�-���Ƕ5!<d=M���tv�� 8&��@����8��@"{��J��UQ1LF�V�y'�bj�ql�@,A��B��P�9�s��6l �ެ'�����O�.i�����څ,I�5�`�^"N�B�^�;����v�S�{�@����䉦�Ɋ��ǡ�͎��1�B����2����H$35��R���m,�UE��b����IN���2l���vL������6�l�4�LxB�A1���_8�
V��k��˝>��.�_�s��h},�$۝xѩ�n�龔A0TF;��%�:�n"�#[���,H^CVvC�T�k��}ZI�Nڹ�9�?6�ɑ�/,�5��?(@�L�ͻ�!p�xq��1pT�ݝ�#7ͭA\c�Ì˝E-.�Ҍz9Es��3'988e1�U�#��ĴBL�|��p��f��������c���5U�S�k}
�x�٤����7IF2�ne�0{fk�n�r��l��
u���Kk�}F'~�_xw!�h���#��[�r[ƈF��I3A�-�&�`e����">й�k/Ln8��a�n����?�"p�F����(�L��ҍ\T	j��l�B��:�5���Z.��?;�Z�M�o+�,���+���OC�~��tWl�$����P��w�A�"�W� y��4o%��V�Pw����6�BؤG��CB�ۑ�*�+�e���=l�k]�@���D�;	5@��L
�e�tY��0b�8uSO������]�8҉��-���裣�;	Pf3'�ҙ�C`T�T�&��J$��݉�8�R0/b�Q�3[��V9���Թ�c���J�Ɖ@G���X�Py�}����!��ѳ@ql���Iŧ���������EM��U���V������')A��y�#�$ᪧ�o��e�c��
4E�*�߾�M����CP����}}�-X��n����fr�j�X��.����4�Q��u�!���M�sܼX�V�r:o�Du��*3S�M8B�<@��Iv�6ZWY�IB�"�����e��-��N#3�JZ�
Ǫ��!��Ϲ�XF��Ӻ�zi/�]��&� ���ăd>�邒�/U��W��h���`;���M�U�e;T��*��F2H��"��}��.�po�����(� �A_��	$�e�S�x[��2�kע%�4���g�Ϗ����O�P$��RS����u,���I������@���<�}ϑ� ����]���I�aY)����&�����}������U�j}�꼮.Ы�e�r����c�z��`#nN'��H���!S��ے�^�Z���^J��:)d�0���H=�x��<�S�q!CUh*~���B�W@w.���/t��k�|-ayTj �3��#�?f+M}��
J/=�v�h�x�&mN�JA��3�<� �����l��O�G�![�-:0�X���	�+qȘn�S%��w���VD�T�4�?d��;:A��F!�)���=����?Pq��gpE"��L���$E�(�k3Q��/��L��ډ/k[3�ȝ�9BxtO�?�{��"�f�4�h��]$�U-��-Dh�[�p�UC .�H���LM��\�����k�j��\���%GnAk،�΂�V����$�	v+At��/��6�!�RC����i��ԩx���u5���,�����q!�z%����$7����\6+|�춁���T�+ �by�s��1�ژ�H��M�Е����`�Ld���ڐe��ę�������T�(I��?]���C��nZa��.�8*��mp�b]O����_�_Y��Y>!�?Ϥ�R�aDI8I�����WHT�ڧuU5ʭ�s�	I��H�["D���T%&1�������<��k���l[
i�<�+�u��έ�b�����|8Bxᬀ	���/�V��c�7>��O��F��t�Y��=�tDgkmQ��3jd�|�BZ�f�����@��G);i`bd{H4U��T�r�ng�0�Vq�5Btpλ=ї��4e�s�E�΃�tv4*�(�K��|3�$�렻�X-7;�6T�P
n��������)P�9ҧWō��P�׋�7&.���>�ȀL��D%��5[BE���v2�Gk҈0�G.�m+B�u�����\`�?�n>mJ�Հ2�<�ɺ�u	�I��r�Ӓ=��{�M��V�(��ƧD��Z|d�$d��r��&ڎws D��=���添���Y�uPJ'"E,ͺ.81��G(%nk�>=3¢�2{Pv$�~T����:ʷ��^��WQ���]X�a�Ј�=����4��X������P'}�e^xʺTk֭X�a�~~��|R�/#��tR���"3^`�ɆO3&�����1j�˕�t�pr�+b�$Y$:��X	�M�R�CQMz�3M�࿖�l����d
�h�_�NBF\VX��	��yM_�S��:jҼZ��@���Z�5�����!�QեSS��N'���`�x�blű�ʸԌ��[*j�%dq֙�^`܇V	վG��E�F���Bx}�<�b��r���*�h�/spX�-x[6\PP+C�]��tT_'U��0dp`�48��O(�АA��` �1�1|��U1R	-�3��L%#�wZ�q�r���� M�@*�L�ľ���L����7�zJY�x	����k>S��N���襵cOr�P?��wB�ţbD�����,���g����6+߻�-h��c1��c?\��7pK^-����O_P9�:�R&K�c� �8BT��n�}� �4�SP�v3D�`'Efdy���l���\,�]r̴�S'y�$B�-e�:�$�D?�Wf�5��0y�c׹	�e����&��Hfv1u�4��E�t5�	*Ug�+%*Y�� �2!�TӘ���t�cǮ�+\3�R��`�o �C�1���x��<`o���y���	)t'O�J��~�]w���M<ax�!�}�Q�4��F�8Qܯ�u�R�Tm�W��g�wт��H��;=C��@<>�/��Qz���C]�{���B�=G5#^�̭�&��A
&{��%1��C��\�		�<�@L}'�!d�Av�|،�a?�n�Ó�H7~���1T����^��X��:�(��1�C�X	��-:�~�3���^�;-��_��`��� �Q�܀��-��?%�Ib-��{���SQ����5�K?��D�7��g'�ОU��?V��ȸ �݉)�xT�����.��t�',�f'�R_�e����/1id[+�.|�n�*�\UQۑ�IK�<֕���$���D���B�L��vY�����,m*?�W��H�|5������a궴\�+�O"���^���g�D�(�N\fȫh�Äo̥����Fh�^�cw��D��C���ĥ�$����v)���u<J$�5
ۀI�Z�� r�����-m�s�,؅�cm��
���U��N�������;d.��-��OmwE�邝s$�j
��a�(�7Zf��>��cG�i�����:��;��i��O��z�_KCD�C,�#��H�(�� L�U�ݏGE��m��T �FFN�Gga씔ů�"�=����C�1�>���j �4���^���E��p���	�$=lVyh�dN�WX�Y#Ӕ&��r� �g2X�O�q^K�;�+�Rd��޺���e��5��O��5������.y崖(�P=�b�΁A��^��pԚ��!�
([��?<�?%��̎LH���U��v`�F���*��=-���'&�E������bcVUz�b�ǭZ�t�X�,����m��ܡ��7JP+L�jU[�L2��n�����t�R��p�)�$���Y^��
����c#���p[qz�$s3+����+��oڼ=�����+���91�>A܈��d *G�q���/�T���
y_�_TS����-~�O;�Wyxh��v0��;	�#    1����Cg��� �$J��1��{!���hQ�g�=�.��u�/[�I*� 5�l�ij�|�Dw���Ź��J� ��� ��P���;�e �5����c�>���"u��d�D�� ���%�a�0L753n���n=3�[�;��Lx��Hi������t!��G?P�CD�H�I�s:�*qJ@¶���c��Ht��}^4�:�T�BAU��5W*ނ�ߟ	���
~���^_��6l��H������̵�v�ӂÜD}��~%�q�e�I\����'��]d�W�p{2����aRۣ"�Bw�ZRq��]���t��8��J��
Y�缅��<�mC6B(�El9�M��#v8��	�Z��Q5��(�#,�����'��y�Z0�L��,&<HW����, jp=�U���n}����m�.�Ac-r3��t���@�q4Sp.zDK�M�]�aLΦ�0�ڬ�͠�]*m��K�xe�JhHe��S���qY�.�fy����WyI�d�	ߨ���⦬�����j��s�FK�|�٘�l��YKQ%\ "��e"����!Q������Yͪ�9$�R*�μ9�����|��
��p)*]U��'%�3;f
����6������Y�4J��v �FM( �6zC�-D���:�j�p�k��r�B��X5�y�賽�ĵqd��NfO�"�x:�yAC�y���(!�B�9���wK��ʺ����,� �����.mp�cl���趲�#檏��<���a����Z�R]�L�%���*��/r~���#��D�܍kꔙyI����n4G6
�e�p3�QG)�03�h���Ÿ��7�����t�av��}
�5r�����͟����i��3ڲ{Ew�Fh��~b�R��Ygq"G� � 
,�ں:�X@1�Ť�B��e	�UP'�����	x�<(�_$�Ț�i�˶O���#�$�����g�f�D�Ԃ���*��8��ۛdjr�lȢ|���M���:�"I�Ɯ��q d�	�sTQZ�����Hm������+u?�檮��ef:/���*I�И�ޭ��&��Q&"��-�JSb,�
�ҕM��-R��K+�
�VP�Q��ڲa1��w&�����>��Ƣ1��0*�>��Ny�6�A��!�
2�;'	���u}�����%�7�@���z䩀��I<gV��q��D��J�-"�j�����CS�=��X�4^�MUͯPݪ-�!�4��U?�꛰*�TE7`sNQ�G���|h�F��w#�r4��q�LR9��Vm	�\Gn~�]Q(kGd$Z5dF��:�O���Q�Zn�FxJ:���¯�����>�
&��ӿqO�e�c̊p�K�h�!Ԑ�J�M V��s��C���|�(�@q�&jf�U�PVM�e�t��h뎛��*����AT���5�v�6���L	��G�&��q�ˡ�k��Aw�~���
�s�q΄�����g��BJtEq숑����J������*����C]�S�Ez��':�H����܌��&���>R#])[_�>4|R�����������Ѥ�+��&�D��G�y����.XE�(���N����B��p��2��_�~����yM�0�慸.����h�h��q�}���q���21���)�Mgiv�ltCț>%�DL�}�;���+�׹���'{׍���`��\�qs����4Y��qخ����~�	�C4�	��Np��l�M]�t�I\s���]�D��z�q�-����<ҏ�]�R}�d# �^t�l�$�t��A+
²�`r���}�bi&2\�Ӡ�ء�UE,K��z'�Q	�Z +�H^����|���Ok�f�b��%S�1/m�M[��?s2��Y.�
�A�Q���]D0z��x��'z�lܤT�[+��6R�juw�Y�`�MG�o���������@Eq��)��;7G���f?d
��0��y��N�EP���̰N�Hq[�`.&=N"N���c�����0k��>��[��2��p����I8(���FS���CQ����h�y+��5D�7�nOP���%<�'F(�kټ!O�c��{8r��)Hf�߃xFA�J"6[|pto*M�V���k� ����|��iݼ��2�6,��9!�oD?�^�y�X���M��v�?%N�?��.F����| ��r>�>���jO\�K"� �Q��B�å\"f_ǰ�Ex!��0%/��\@�HN4P)׫�*�x�>h�&i��ՠ~-E��b�5�{�X>�Ru&��z����WH㹾B:O�n�ēJ4��H^/�#\Li56�ʛ�k盝�a�FD�u!KϽyA��W�+��:',�&����2zJ$$c�P��_&�(��2��3�ҍ�����~��y�Ie�֩Hp8#��M)�Ҝ<�4��d�h�R��5Z7�V�<��9�yj1�UZ1gx2<�3�I��B} ��ۼ;/���6 "wc*�V���]��{OTLD� �������������^w��M"=�������S��@8g\ �5rc��I�ӽ���]F)�M�[.d-OY�yI��/2z�as�a{:	 � hrܲ�t~��~���g+&_���V������L=o�uvB��N��Y�e}�j!�yLuV�M�K�8�c���O�aU�r;�U�4˫R7v�47e���6�[��c�i,$<c��i�סS[A�o�i�H��=���q������/.�����Pos��H�m-���s;3M�u�pG�ΰ�.���r�+dFC�G��1s���BL�V�.�{��vt%��[i��C���i��E�}8g����"`�"�e�&,&$���F��d��R楙U&c�*�<^��y*d���h.6���E�
�����c��y�XCH݉�)y�I��c���V�e	?���[��;<��V8�t"Q[6-��+H�c(A��u)"@�'Mh��q��ۺ�sR��R+ǳ�b��̀ �(�0I�<��w�㒒�Q[�
��W|*m/yw��u�`>�D9X�.��i#�7o1:�)��i��J���V���0YC�b�A��d�8�!�.2��{�"��E��{�ʨz�Q��S^ 9.JP��֭�iF��ض�N�UT�#�oE�&���u�ӖS�������֭_��?�a�!�7����^�U
��D���\��Rx"0��آ�F�I1�@AL};�2KIeF�ˏ���9�pߗZ�k��Ze8�C���I�Z$�(O��(a��\� N3>D�H��K���J��2P�Y���7I*�$����i�OO=ӬG������ U�������	"|���r\\A�C1��g�y���:ǥ G9Bg�*�{,sb��8��z�J�a�-ԉ;W}�?v�>���u��n˃�rPȴv�r�����I�y�-*OuX;�uK��"�N�����UyU�<K�jF�Q�9�1*���+��5��}��u,q���x�ڱ2SO[%8z�T�3�B�$ڈ /[�?��n޼\ׯ�
Jez�$�'�Nw�\� p�!sk��EC]���:9y5�1_=Ǽ�	=j��FF�xߗT�u'3s�FK*��M��X>��i�a�~<w��0���La8rE�
�n����s�rA��~-+hɦ����@T�k�BT'�>��B��'��'d�s%Tݞ>���h������A����O��i��S�$%+�%�Ԇ����U��i��P�#l�+���;��&���������B��$k��F����
�����!#�}U��)�^]e?��:J���F?�އb�8d���0�K��7�-�ϐ S�]���Wt���lԫ�z�(�^�������D�$�Hڴ�=�����9!ʺ@�k��F��ρ��,Sd�t;z�sn���=�k�ͦ�pT�X�#�!xږ���О�!��i�z��o��} �GA/5a��|�R�5W���E�H�C1�[�u� �ʺ#��`/-���M6���������FFu�B�l�j.�I��Z�	$"˱B�"��    ����L� ��3�|��*�a���B;��P)/����u,�����-���<�F�1�m$;]��Á���9��'
�Od��W�b	L.�?��Z:��BvKHt�rA`ȸX����K�`�x��(5ˇ�r���AB[�!���:�2�ۻW��e7�;�]Y�R���
�,���n�Mp�> $�0���o9���D#�!Y^�z4Ќ�ۼ�����NyB���h�5�$�nnH�6��^�񆲐�D�+^�%R����\h��T�s�������_�(Q2P�j���@�ұ��7�q�%w�X�Qİ�β3�$$B����<p�T�����Aa��t��t�k�����"Љ�g�ކ6R���-4����Q�r��*������e��������S�N8R�*$������|�'�Q���M*������;f�����9�a��\'ـ@q���q~X[o�m~�k:��4�L-x���,�;�
�j'��Ͳ��cB;�#O�`�r8�Oy���6�h�#��s�9��BM�F����Kɫ^�Z������Q�TЋ@�:����VT�(��A��2"�.�Bp+ A93|��� � ���A� U�;�h���N��]��O�'�Vuk�6������΃9j��lCw�g�Q5�(?��A�I�a*cI#z�49q��*����6�c�u��w8�py��� #~!�y~��M�];$ƞ�Ree��1>� ����0H�.Zy6:���dC��Q$�������FP�B	�(�7��C�R>Tn�_�˘�<�z�$��*��4�n&���1Y��8��X!�a�<���\�M��6P �!i�{���K#I
���_Z=.����|#ٿ���?}ٰȱ�<�����nH 	sP(�5��o�a>%dxR�:+tqBt^u: p~,6����Aj�h�5����R�Sw�[\c݉F=�<�I�캾﬷FҲu��UԒ���Z߱*�'
���['����2I�ε�8܎�7&R1��N"E�m9�nQ���%�n��6֌%���������õ-�D0�g���8��xU�<���ٳ8ɪy]����6�<�&Z5D j���QQ�l�Ѭa����Jz:f�~I~l�=��༼8��t�,�r���i�I�$J|��M�Q"��FQr���`�ޙ�M�3ѥus�rA��;_p=�MA���N����A������(Cඖ�&���2�������~u�����V�̿2Пӟ��&��Fk���hz�P����y�]��%��n�1g3e��?
#������K:���/.Z�\�B�u܄E���>�5�����+.^n7��"���'D`�萖�%aS71�ץ��)/����8<�����������>�-���咼�&���D��g1����Z��t�
�KV�	�X __%Ns:)��� ��\��7��:ٹ�kNOk�>���B�l���q*�^G;���ˌ|�YϞ�Qcg��.�A���MX�!s�)�	��s$�٩��]������#�ޏ��x�C�0F90t�����8����,O���<}'�5�^�]e���Aޫ�Ki����4aT�K���H�ON��L/i!+��u����u����u�~�G:��	[%E��k�AX;z���X���� <�����T�e�F�kTV�r�2|�x�2�{�B��+W��ˀ�,t�E�i�I�R�Z�ؼ��5�"ju��H���X��y���4rA�e��}��Z��,dA�e>"�7��<��\�²i�3MH)��`������_�C[z8�.��s{�fy�kTCH�A��/�Ƚ�����1�i}��m������̳ҫ/&=!�|E����z\����$�4�l�ݽ�>�ѤMG7a��*{�[:��R��zcի�U�I�F 6T�eݔ��}��bu<��r�&��$��(>B�ĝ�_��-U�Lo~��}��G������{wfFX��]�P��:4�F�M��ic_�)J�Utd2\;��W��Q$+����UW�N%D^���|�(9���yh��w�]�^�20t]��N�
i"��2��e�bE�u����y)�\v��N��P�N{�KBU7�!v�@�-߷G���*�Z����H&�]����6A�.q�70��ʾ�^�@�E�0*�;ʦbj�T\w(_4�QTl�7�-��H��5W7�?�$|cC������/�Kk�2s��X��l�Sep��J���D+Q�Ov ��D���Xhd5B� ߒ� �s ��!lfA �u��񽤥$�Aν����^��~�׺���eA�����sj�{;����V��cL��WCT�ڼ\���q�@����R�6qv�SG6JR�jx_.����fɝ-�gnBf�d�'�F"f|ꂙ�4"_�W�`!�|t���k"h�<��Gk�Nۯ��F�)�\:��&.j�cd�UAU��Wz���j�S;Κ�n��������.M/�Gx�kT)�g��0���t/Z��14�Pa:
�&5Qˇ�Rs8��ؐ17[�:�6�t��Ф�E}m+�g�뫷��/	>x��TʟDU\o���9���a*���@.��,�|*�4��h�DQ�D&�x���<<uUe4봑a�p8������G�����;8d���}���["+=������^���vk^�y�p���:㌡ʫdw��Rt��>^T�K+����RC�{�x�ߞ�9� �r��u�,&(a|]'��F�״	�`��/��!�M����d\+�a��H�a�~Q�;�!p�O�j�p���b\c���df9��ي&WN,�8��j��G��Y���*W�j��h'��cq!t��ͯ.ۮ�
?
�� �{N�v��ټ�������2��^f~�����q�7QG5�[�:�qH�����3X�(?��~�Z��d2�N�a\�E�����+dB��Ji�k����Gk-'��&y��� �7��Y�5��g�#[���+VT]�A����j�����1蚦';�@�4����LQo�񮫲���'տ��OݗxO
U(֑~x�=� 9a
oiR�`wyhY���V��Ơ6�K�#	� G�f�d�DR'm /뉖Q�i�c�#�^N7�X�@��0?�����UfR�$;�ΈD]�?��,�o��"��Cג�)�FR�~����[��E���k�˖�8�6�����c�kD\
Z����M��MR��4�J�I����<|9K���6S�n**������]�8�i�i�@��`�j��@}�3=o{���=J/�R�1R���8�C�nu������j� �8P�1�S@UP�yi�~���kH��j��r���,K��vaܱBz���$�L�"�z[��u���hO�0�Ȥ}1�@��P�rV���G���,mL2�n	�FoVߡ��0�yu�����yS�k,m�q]���ՠ ��y&w9��f�2���~��~���l8nH�IQj�x��p�Ԙ��U�^�Q!�Ѫ�=�S{��f���>�3i�dZ�iL���Lx�̸��̌�d�M	j#b.gW*�kM=r�R�Q�8e�4~�iϛ#J9�BJ���i�6ǋ�YeKK���ك�r��M�����`3Hs�}�M�@(G�5��3�mZ�L�(�\HK[|�h�"�^�r�9-ݧU!�Hu/e��p�l�~��J�n�cی�F�h���&� 1�����7��~
)�^2u��tG�&�D���a�W��!>�]�Y�I��-�P|�r��Q�P��d6¬�q�V2ejŎ^�ε�f��|dGW�:]JP>H���ڝ�[y��4�Jw��MG�yY��ш=uy�eP{�f�ɥ��j�[:*,F3!|�	��Wɇ"{-���WuB�Moh9���'�bv_Z����`Fx�P���I�� ��L6���<�!�o`n�.8
Hn�r;�,U蘿��e��5r����\E����` .�ԝ����D���y�I���x��d��2Ub��'��O�[\�G~{xz��/�mt�GR7��$���l���H`rC��'Syp0K��;<]�    d�=��&3m�`�u\	�J��\X*�����������%�氻�t�����	`��Ja�������f��f���:���䷮��.�ۯ�s'��6�t<�o/�
��^Yv�Ӄq��㧾r��9�Y�����*2&(\~������OR3u�����斩׼,�X,˪�t7�^Z���
L{�Q���J
5�vQw��R�l5�f�*��FS��+y%0��q�9׎���xk���9Ee�������b߹Q?�*Y��?r��nwj� v�*h��"J�t��|{F��D��j���R����W�(eWY$����r�(�H�E��p��t{j}q��>}���>b��\��9�_��1-y𾮮n��Z��bVj�p+�*�g2��r�ўy��*��LX�Cw|�
��Ҵ��]���g1VL<����ao�zStU8��2�C�*H��Qr�8FS)jz\.�/Mh�gXC�%C��I@8z�V`rT:���N������ďɃ%jXw	���vv���,/�]�ǩ�����1��;S�[��v1�_x=7ic� �\w#Q��m��zZ:
sI�@�����V�xT2TA�H��͙����(�~�lۥmZ�F�h��4�M��ET��&�f�"f�֘A�:~<ln�U�����}�U]RI��n�]�Gz�1,�RIí�kY�T���,V++��\���W��^�/�˻׏O��P�W�����p���t���FmmcgڢS+1k�ɀ����g�meWP,׆�d����%ν��<���I�U�~=	 �/�]O��w����T<>��Lə3%54���z��7��{Fi��*D2&�}��5Ӏ0.n���Vg~AsL1��?�m�Ϡ4L�\�EB��P3�s7/&׫����Ř�BJ��m��շ�f����DH�?if�B���%0����#)(�����s�z��3���~}��|?��k(I�TO_!�\=+��i����P�erpU�"o1D�ԥ(�J��4-X�y�\"/�9�����B��ß���������td���B�x��֍-iP��3��_W�i��
��0�����fVfS2��Aץ̘f;�|�y�o�A!�FףuA]f��P�>��z����np������ˠz��������ޢ{�cdC�&)z9��&�3�KZ� zG�Lm�;ꮿ|�{Ŋk�c�[D��j����M����YF������|[*�!&�;ŖO̼������Q�n��ӹ��	��4�m�a �в�򕪁j����e�i���N�S��Lk��������?1�����}����j��6'�uퟴw��EE�0�a�t��n��:6���]tj�F\�U�4��l��2jZ�ҥ2�O�似{��/�>}9]?�"V2w�Eo�c^,g�}�����9,3s�5FH����Pz�ߠ�� �I鳦�?!�a}
���z���i�����I�&'��L�&S���^�>}4�-���鳤ç�]�F݂��t���}�G]X`;9�_1ɛ�x��3��q,�d��<����J��1\���\�z���[U�L�A���w�n("<�`��r�D�:۵u�Qc��O��2��Ҫ�Ay)6��ڷ��xw�L��I�N]��^(��o�j�8v�N1�������.��lU�e�Ȏ(��']'�:�Qd���R^��;��x�vi�t�0�I��3������� �'>�.K8Yx�.6��T���ß�O"����"�+�����4K�Rr��`c�f�P�������)����h׹��$����5�1�c5���� @OtU`�`�r������d�T�2��;5n�p)��{Ce�ݾX�I&e��ĝ�Pl��eݙ,���p�u�Np����𥙺�ة�̮CO�F����`��ފMP�D��>B�pV��	�;���Ѵ�����|Ŗ�+������������a��"�3ݙJ\�	@
�����W'5�R��Y��h�(�gӫI� /��"��T>Pme���}D⾮�aЌ\�)�.5�h�\%;��:-�j�\[ �O:}EA�r1PZ3�Q|�֗�I�5`�*��D1�@��T�u�$ed-���{ӔF5��j;�3ԋͥ�MXq�s ūHn�G>��&��G:��ut�����K0�����@��[��S�^�e���,��3��1C?�w�/}�@i�0)8�r�x��	� 0��҇ɠC�r��p9MYK����Dq"n��z����+�����bU���LLt��!£��_���_�>@=�+zs�17���%Ƃ�x��U��F'?��f��qCO�þ��]�����N�)<g.hI�b�]�W�T2B�������O��/�7}m�������q&a�?�Lޖu�Qa{|��4�>���'5�]>�D� Ua�B�� �J���' \~��Ee���q��tWכi�+�������2� ���f�Awl��� w�Z7�=|�x"f؛n�6U0��F��3�_�r�=u
�*^n��jR��C۵�>,e����K�Pc6ch'P
J*�j��tL&��;:���`.[�xtt͑MNrl7�� �0����HOW���8��P�d��ab.f'0��EݠD�(��[=D&��nB@?o)k<u���5�ލ�L:�BһI��X�:m��g��41�`�6n�8�¿��|�)���i�:�~6�?A k��o`eɠM�C;]7{�f���m�迪ݩg�&�<ͻ���-EE�>~�	��0�&+�����O�k�H����2����ࣉ�^�c��ac?U���E�U ���\f�o�����lJ����MM+�ge��J�Z�k}��mT�oη�,=����Z6���I9	%�=�<6����A���SB
��m>V�����P��hid�}����KZ���W����e/'-����p� p85P�	�������*�%�qLC��̴��s���-��#C���B�pC+�������4����2�/"�F5g��v�p(f�=F��Aو��`N�M/��5���Ҵӊ���>K��uhT�T9�1'�>��["ćAt���"BM	�^�r��r.���H�MW�EIX��;M�`���d��o�߰�=�}xj���6^���+��*W�L���	=���
39rL���
�z7��G�/C����~���`�5�m������ymRy����W*CZ0�,���l����+x���\�ݍ�0^4�ʸ�A�/`X���0�P<��m�*G#�H={D��}&��莴@)$�]7��,}I�T���{��0Ӻ��Ym��!�Փ_0�tTM���{����\�d�^j��0f�7F�n�r:[RN���O��9%�j+����b�˧��uR� r.����	̛����3���M�L=4?�1}S�^�Zeҏ���OX��D�K�{hc��%��\��&����$�"��v�-.SD�j��\ɸ���<�� ��uBgAc����������O��=>�	�?RPh䴹;��d�(Vy/+�7��@UH�Owmd��տ($�k�P���o`'jf��w�l���Fz���@)k�L���ϛ#z�;�ߩzMWܓX�v�+c��T5��Ψ���f��ψn���*0��\Fv���J4C��*m���UB@�Eo�������6G�QFo����6o�%M��i]�.A2�[��T�8O	�������H��S_A�"2������FR�7�h�AO���~SM�q{B��>6���K�pS��c��������?��Dκ;03B��rC�����蜬Y�(s/
F�+�<:��)<�]ÿ���=<Q+x=P$|��yk��n�3w4����@�"���xݟn���ţޢCW%�e�[���0��̸̏X�p�Ȕ@{���/�P<���7��������dN����x��04x��������0x���m��/8�X��sW��^�~;����S�Th8O߉Kx[PLcVa�)Bf���о�ұ�1���2�z�#"��*,K��}�RA�-�r��    %t���f;��i�E�c~���4\v�{���e{��Zt[��k��{�`B�}1���V2��3��QUC��n�����yw�*��V�/}�Y1��|�Y���������%o�E2\�.�0Fė69ʟ�/�n^<p�!�~W���/N���_�N�wD��'��6��f�P�dZ�R�����f��3�@8_�Z�o�]Bs���-}�k���ޙ���,���4��[��r��\��LAGHQ����U������Ҟ7��������YB�/��A2E��D�����l�7WW�Fy��C5H�Iy���I�0��j� ���8B	(�0O���(�c�)R��lT��
=�<�Q�f�N�|(�b!��2�o��pFi}��:<�w�Fa��z�Ӛ�������.�Mԛ�A��C��A�mV���`@�	���
ל�����]���O���i��n0,DJ���E�	���󅆏u�\YJ�4$ݒVzh�:�!e�qb+J>n�� @��k@aB������'�pX�N�h�m�p��
+�_�z^�*���3�	g�� qV�2��i�V�\�)`3�7㝾�7�R�:]/�l�2j�J��i�Ca��x��{�x�B�34C�L:ڵ���l��ٸ�0���x|b��)��~;�bR�жO����U�|S(Q�zN{7�
aE���i��A!�� ��vL�n��n�S�%h)c.��t{�t^��h��vЙ���]��"��RH�2�	�hE3�t��」ʋ�#�v�� U;X$��಺�,��#:�I���:�~ʐ�[���Nm�h��~$��S)�tc 6�g²v�3�۰���2pkǏ�-�E���Pj� *.�v�U�`4��#�*���&N��ZK�"Ƅc�=vKm�B�Ū������Lj��"PK3=R;T���d����(�FǎQwc�Cv��&�rP�"2�C��+7��-��F�݉E�P.�aUc 3��֔���8�*���MPӥX��yZ��.X%�U�Z[�Hntc��p�.����s1Jh��d�l	���p!w�Bq��|s�R���T�:�n�1+I�^�&�OP�uPY��Kl����J�L�Zc.�!��Kn�S��,����3�*hG��l8n��yž{+� `�/
�sc�(�EHt�y�=clD��]��G��L���Ӽk|��G<���$̦���y�e�v�����G@	��3=EY�Urm���*�1�h�i��᫙�����dc[Bܝ�p��K@~�f��Q��j8��w��>-�vө~�.KüN�Ԥ��VZ�5��5q��]���D�U	 ꦏu����t�$�&��:�=;�T����~Ψ�>C~8(\$(|�r��I��)Ϟ^F�1 �/=z���I֔l7��!�OpqF��� �𱝤W�S)����4��7�-#Œ��VҤ��pA������=�el��3���u���a�xoN�9<�������*�4����O��ԍ�5V��维y˴�>S묣�ZԢf�rU��{Տ}�U£j��.]w3�B�IL��a��Ea����7`�S]9���	n������b˨��d�zE��)�E�p~��xu�JE��l^��.N�u֡i�j���=z�T����L=FCAg���܃/WS0S披�, �߹����UՂf�ĺ.��z�.򽮦�S�\�4Tp���/����?�Ĵ���y��pj��V�/�rM�RV"���$i	ԫQ��d�6��or\�UX Ӣ ws���k�W?�u� |fK(�>�i���u����^�(�!�`[�����J��oʱ��ͮ�� �5����Lf�pgt���9����T�p�9���h�IM����l:c�1��ePa���_�%Q^vT,�ZD?���ͱ^����ݖ���%���~���&��ቔ����;
M�U�h�o~{��x��!���֊�i	�*=~��}���9DH'��h�o�k���&�fZ�F׫)�P��72�:�2�Q*C�����|��]m&��gj��D@��6�ݓZ�1#�H��R#����<�F�8N��.;5�F���Y�2��d̔R S���}@��k\t�o�	P,���e���R�Mi�v�%5'�25��v�[y��5I�ٷ�G��c龪y�BIm�2ƺ{y���C�X�b��44Zhx�0���X�s�����^C�YT)�&���2 �ti�������۹���p �|[���&*f������X �m�Lpa��6�/sf�oW�rb��3�ޭ9����#x���lň���E�+ȍ4M�h��XS���4�5��1{�~���@/�C�5;��e�����<sn0�M�q	f�~���ρ�w����D#�&�'���A�`�|�:PЌ��̛׭�����A��	�8�i�Q1�5�bM������T������P}D��f��V+b�����E`%�8�LOT-/\���yG�tLA��(h1�dŤw͕�Խ�Ga��z�v�]t�2�E�?=�>�T&�O�}����%a8Aw����Өv�f�@��vQ���z��O�D�>��Y$����BZzL�Lg�M��D�ɩ�Ƒ.P~��YM�+ tHɘ�c�[�du^+�le�6�j�f��Xcq�v?0����:����a3����m\������7L�qU�������Kqֶ�[y����v����%�N�E��Qe�]f�:L�+����`|��U�f�� �Փ~�Ar��V��j�������j�� �@�]7!㪵�C^�V݀��h���'���'»�������������rs_��q�F�AK$�!�f�ԡ�`�X�� �s���ǲ�CPk���Mͫ٥.NVA�P[�V�Ԗ;p)a�����ֿ�>����Zl�6ǳ�v��V�P��w�8�f�Ǜ}�O�+��'�{�ȝ�ć��i�"�9ĠG��o�8�
}a�����-�
Ip@��}��n�P)f�8d�m��B���i]5�a�0:������
-����e8A�V�8�{�4K���%�����
��?�o�>\�\�(:�MX+��zA��Jʉ[~;kۛs1&
�_�|���f�����]/�I ���X�dVD�Vh2j�ˌ����a,?�N=Y/3�JZJ>|z6C=*�OT���u�An`�'�b��u��R7�&=��љ�%w �egfHR�x��pws�&��fh����y���!��7WdH��荀�C�d�������<t�d��עa�lj�ݻ&;� �S�[�A��� �k�J曦����Fv���נs���M�$�̙K�ʼCM��f���=a��h�_��S_p�a�N˒MF1[�Z"�C���:o��SZ���5�qqS�a���՜\<� �ݡ��u�5;����tuzF��{��ga�@5�mԜ��l��B�~�P�԰7M*c6����NP���Qb)�͔�~=� ���aQ�"�*d����sYo�y����1�"\�b)���Mŧ���o�$j�5] ���`�� �D�с���S�:�y���u��t�6ze�,X�t���npf�1󈑫���3�`1��p	���j�]�~���������0�5�Ν�s>�3��,s��l��R�<��� �N�Z �	�&�3����A����mHJ��M{gO�q6�P���laW&d�o#���'L�^T�ֲ��΋}��]źܵ9�)K�c?��x�� �	���+�d�-p<�9|Z�R7] ��G��1�Մ1�y��l��R����07�h�Œ9�1O����Q��a�0C��������ԑR���~*�V_2Fau�g}��>a�9��t�i���"���m�K��Ptq�x]���E^�Cc�D������� �*u�*I�E�W+���޴9���� �Ƌwb���͑�A_�_��O"���N&��!����2�-��k�$ibU]K#�l��PqW�E��[�*`������ڭ�z��(���2��k@
�@��z��׍1ȵ�ݴ�t"2C��^�p��'r�[ �  2o���(�c�+�z�y �X�0
W�nyu��1%K���r�@���2��>i���ed�ٚ�R�ċ�$�Em�ܽ�����A=�·5�Ϡ����G8����L����Ԑ����I��;�(O�HZ��*I��������`-���{&�p�`���QY"cD��$W>S�&e���:��4����^�&f��x�txް#��'��O �B���v�>�����W͖�Ɇ��H�V7��D Ή�O..s��%>>$�������99��ڶ��9�����2-��^ ���f�5_>REuߔT�Lל�^J$3a���F׍�S��� �%5c���El�6��yI�mK�g�Wso�-��v!�fX�e����d*|�k2�:�6PI��J1^� ���2�I�B�Pn_c^Pgz=t*��8+���YL�Q0(�T�oj]Y�����˄S�^��Y��GdZ�yҒ�|�o�2V��  ���H7�&�u�L3� a�܂�@z��|���Bgd�\{w�C�j�!��M�V�$Vo�[C?f��W�./�]yԙ���vʭ�i�N�d�dB�GfS�yS�bwF���-o��t��U�d�4~[!�	t���a�9*}b4&�}!/��Mի��?|`�G�f���F�kW�ufFE�u�Y	�_��ޖb�m��O׈�܅v����BL�i6fZ�D�;?��?�>|:�>�~�r�9��*o��z�@Lj��:E��`߭�^�J7,!�������#S�nj��г"���T�*&Z%|:׉
�sE��ج *u]��MX�+���?���ɼ0�`�Jzc!��,3�!#�J�6ъ�])(\���p��m��	�@�ݻ���7�˝�f��zo~;"}�s�T�}-�X�=#(a�T���6�Q7
��%!��d~�A-��H���ɭ}R�	���&��ܝ���xħ�$c��\�`d�<��<1�U� X꧴�6�O�g3B�z�����D�|�вi3�9=ȧ�� 5�U���C�a��ZrDظ�U�k�op�e�9S,$x�Os���0z�>V����o��+�����%�)tI�;_����4���*\��+�)[�=צR�NC@8�>6�QTO?EPN!�q��t{�v��2��Lena��i2x�jNƌ��4����I/V!�����J)eO]J�N�$��Y������/��S�mT	 �K�-��Oz!�R����F'�MU�ζlO��i�R�@���i�+���n����4�y+_Y�_
D���fƉ������׆좣�@�.q�F���0g�Y�3ԅ��O!i��ƦT���`8���Q�Ӫ/�jtu������gԫP�F�t�?�����#Ա�}lm�2m���I���6r��e���AV��~�T��u%��F��n�(�>�9��B��)XTS��w�<���ϔXF��|nl[�HR6亾�Nf�MY�cT���g;aF��^��RtP�����:R�K�2���يͯ�,��F���I���RNO4���4�Q�, ���7����_����-��]@���F4�b�)J��]���~��?���o*r���F�PcMf:��1N�$g����!�Р�:N��[���|�E�s���xK���p�tg�6��B�+%�8OMF���U���޴�|�b��6�/q��
�1�¯�p�C���� �֔��-"Lk�
F1c�"�;��\ l��h[�U�H��Xۢ�m�n�?~
��wx�7<�T���W���;�:oe����pF��n"Hgj_;�H�K}(�Z���v��@ ���v���_ V�÷N�<����Q�x�T$�fH�����/(]��e��-�qY�=@��uUm�r}�~�k�`s��xa�a���D�<�S*T��)v]�[��6hU�2 �n��<4�7�@���q:|3<��AW�
��D��K��`	7��8�����[��+}Iy:��#�7�1��>�l9��G\�~�/tW��.IDm�ze)�FK��)�<>.�Ip��Hr��A  �m�T�^�?Ֆ�=�H�.�$ToZ���G���L��#�tӺ�wا:�{{�p�u�k�B��9Ad��X�p�(
j�\�A�$a����p�y_&�q5��C�>��'�=&�>caʕ��l�p�����o�6��r���Z��YP���=#_N��n�a�Y�p6�����dܖ������x|���TzV�����X�U�>��7r�5$}�U�G�O��{�$V��;�x�D�v���A�jC�-��us5�:�Hi<Ԥ7�T���_�W��ƪ}G)�Qf|���xc���Y���#l�W��1R��ߏ��IFs^��z��}��YE'�@�'%�G��>UY��
���&k�c�P;Z�1MCc���4�a���a�@]��sYu5}��0R�h�5\��p��ƻx:�$����\��}V�n�
d�qq��٩�r�.X"2.�b_�(���we�����o��lS�%���Lz��*U���Co��o���Yl#`���W�l�&�{��_��� i͇8�`�j��_��S9�cYu{|�$��uۋj��m�L�ʐԲ���&��w�w�{��	zI�	B0=�J|�%tq��6�:'o�F^��%��㊵>uG��O�2O���J�+h)I\��L+ַl��low�ܨF�� �4W���+5Z���������C
���hKP���^Wk
Q]F�n�n�P���E����0_H�Άlږ���[?���b��{�x�{8�B����W����4��|��I�u�D�����]n�TDM܈�(���,�"��\/�F�i7Ko�˝%�Ye\��	��[�1�j�T��\ٗ�\U �鏒��H(G}fVU�.#ʴV�M#�>(C��s3��M̓	*��!���doŘ� �4#�����0#��;L�:�z��T*�`V;�%ނ�ј������}�x�0N�8�vs������(�E������0�~6��0�Y�!ƪ�����\
�a�p�9��u4��W0L�J4;9�U������@��>�;(�����l4��e�B���BŰ9���4jh�S�g X$Bd�P���:\�?����K{r;�o P
��ǂq����8�"a6�ۊj���:(��{��~lT��bq��3b�TTa 	}�O���?�Sy��o26��qI�����E^#����fԆ��B�N�~��Q�#aX\>��k���VڕU^�,�x�j�]�
P�y���W�(L  �w�rt�E �UɄj�� ��'�m�isP/��&�X�3^�w^#�n��Z={_�8Ţz^�@��#��E�5_d�v.�ZnE��#�V �_cC�9r]���A!�L�50�s���� p��?�����7���7߉�[qM]z������#�<�?���jl#�O�͠M��y�3|�ت�gv��Ý��2��%��ϋr�&ւC.�
�"�$�U�s�fad�����d "�� &��Cq�w�s�[�B�)X�?ŠO�'#�՛�B`��UΥRհ�qP�T\D[�� פ�jM.��F���v1Xm�R)#��m̛v�X�7sJ+�B�!��bSR*������"$(.�3�'���2¼���e:�4�.G�g�4X��TS�i��ǧ!G{�:�1]�
9�j���&��3L*r����׳g��T<��         s   x��K�0��)�b���]ظi�%q�8Hܞ�����9�l"+:�3���^@��E����=�o&W�8��0}x�b��X��%��!P���5�JhT���	o�Оg|���,{            x�m}Y��F��_J ���z�v/v��}g���@*���T~�����Py^f�Հ��s⬙�f��_�E�?}�u��O��������M��I�i��չ+]��(�&:�=��i�w����<�Qms�UU�&jx?�:����>^W�_�e:�>yW���ѯ�,��ͣ� �� ��n_U�'��r�p����z��K�ƍ�lwty�?�Φ#�պ��*���7� �W�˟.�譫�"ǟ}��ڝ�u��Q8;��n��O_���;��*�/�#.Ï��_��b��m�>o��x'�ծ�����"z����G_�Ư�&�Κ�+��U1�/�h�F?]�W�s_O~Ik���lߕ��>]�R�c�W�_��|��#p��qVw���x�G]nj}t��M�	�g�3��t6�D_�޾��bYx�7w�_��i}�y�ϋ��>�[�{?gOU�����i����9��Z<����qO�z���={�~ju�c�ݗm����0v3�t_7��~2�̸��=^L^�~����Ps��t�h�i��}��]��0> fk_?�;�I���h��e��8�:rB��D�&�`���&��(���v_�%�H+��:{����Mgx��< �����\� W~����.�E�{�t���|t[C�z��ȟl�g����\Fo+,�����gخ�|��Lf�i�=��zr�h���u���-��|�͋�=p��*�a��n
���[<��8�OU���(�x#��`�b���;�M���C�e���*Kl���U�Y��M�SJ�c<%�� ��Ey@x���^O'ػTe��:No_�\(���w�i�"�z���X����3~V#�ި�)�D�'�T�/'z2� Y��x_m��n|S�9�M:����kf����`�6���
;4�=u�$�q¥F����%��ب��g��;�_�$3�u��/V�/�����,�)��36C�z��� �	{�*�Tm���/�t>�j�ƽv�%��2�q�w_�a��bX�b��U���+�YյEUl�Mh��\���a���{I�l�]���y�����`=�G\Aib�����{n#���|��TO��q��|]�����1l��m��]]b��q������d���7���=q�:\�]g���HE&5}��jН�X��]���]u�Q�5o
�X6x�n�ox�u��u�X���[u�C���jG����./��:�B=EOA��#A�T��+ÖN���³����`	�*�z�[�
���?_�8>d����d�?i�������@������^�:�o�V����.o��w��G
e�������Ee��^t]���3<�]�sI�%�1�7`��0;��4Mx��9���x��c].�i-q}ܮ���}��
_�0G ����5P*��YD�lo���ێmo3��]�_�(Ie�Jl�|E���Df[�O0�;ZL�\j���P�� �	 ���E���ޙ�����j��B��m�}�\,�~K@@�>���P3o��>ћ����u��u��])e7����&���'ո�^�`�L��nչo��7a��6n���L�����\U�[�� ���ۻc��#���T�iq!o���2X�+�X.i�Xp�Araq���.Q.�?V�h��z.�N ^d�"4�>��y�-<U��i�x�@/'c��W�6��Հ����?NqG�l-m{-?�����/G��[��R�ٴ�2:	���e�3�Ű�?^�Wd�=~!d/op�%��/����5-ԮJ����L���UR�'KB�Dp���08_A�H"�8�V>:���h�`X,U�i��O&�1L�����[視�h#�ܼH@�V�K�������9G����C^�\gp%N�	�eW��4�}�]�}�����s�{i��IwBq+��v�ٵ��t<^F�|Y��P��h�k�N\gE(A)��|"�%��⣭9
�yެ*��Q�
�Q�|�`��Z86Pz~�ђJi_�|t�v�?7u ��Ԓ?���,��+z�~��}T���!8�s�й�f��8hxx��o0޹��U�L6�#$�o�p�jW����V({��X�,���Z�6����k��f���W��u��~	��/ ����_��^*����<��]���,�Ӥ��ϻ�D�t>��W���:��6Z�w�����a���5��c����ف)��kO��T�
{	���s8Kѷ�Y.�CWw�'��«����sO������~�xA��`Qd�*ݡ;�"�2�1^�`ĺ��M�/D#�@)�a�l��1X���u��_zQ �@�VM{����/�R��g�A^cw���ܙ�
�|:J��h&=w��]��o�a�u�U�\�t�9��\�ns�G�9-l�7_�\�5Q|2t�Ӓy���'n���5�|�S]���8L������~5@��xrp���U1��v��{Xhbƀ�uW�D��sL&��6�.��A��&���E�����#��P��q�|�{\�,^��n�Wʍ���S]�+/�3���A �L��IF0G�؅<�g�h" 8)�N�;���[�!v�uU�qp�������^�b��9��p�>E~t��%�>�d`�9nƈʌ�G^<���Y�i�I�zI��O��p�g��m�S�������_D���J�s�����da�<T}܉�0���Rt`/
ӈ�c1��h��r��:��3?��c}�@q�g0�ݦ���;�n;��h0����۷���V`\�9�h��>G���ޘ�)}��O�����v=���7�FPR�sPh���A��D��,&�����4�K��=���ܪ^k¹�V�j}���J�F�T^������4�����q���=�b��{�Ng�p� ��~��I5�7������>�dW�7M�v��_� ����	�C2����Q�Hh�\!�������GG~�W�x���-Xr�Wl�_AS�����)�.��d�F�®1�����QN� oڈ̯���Fq?$~��͂�	�{M����M�ZP9��̸������w.��7�qm��>��t|��h��K�I�P8�v1ܧ ���zʊ݈}�����Vl ��4%��{S��'�z^\�Xc���>(� ~���ZBX�|�_Z���l��4�HcQ��+>|/���>@�.�����Uc�v�^��n2#i�و�"_��tǼ�rU���}7�{�U�շx���u�A<���2��c$������\R_4�w̸X���V����.<�2\)�v"%Y	�-g�-l�۪f�5��7t6�u��_@==֨�u���潏�ϲ��;O�V��{ähį(�d>a}���J����^,P-oQ�)	,���_�����aCv�=�K�K.�M�I����Z�v���}:c������<��b]/��4Q�l���I:���K�����6������6F��%���*�2�=�I���o��W<
Sh�BJ�eػO�gFH���&��ڀ�����O&����(
��w���%qa��2S1�C�s��U�/:��pv��3bZm�p%Ag� ҿB3�����.��J ����h�\�t�R��d6�'�q��ņ$�m�g'���C����V�:���
]gXO���%��GUy��`m ƻ �q\�%0+{�o6��^gV�ǯ�S���PE��J�U�<� �t�������瞼ZD0noV�x>KBȫ���$P��Ox�'i2a�.��<�2Þ@x|�V�-(	g<ˊt���}SC��hz	�5�d[�	��������ˈ�(׶Qe(>]��|��_���T�S��i����8��~��'ow;Fj���xg?�{#-s��^9.���h@�[�LnusǄ��-ʛ.�N~�k�z�kF;��Xa;s	h�N��<�AG�\4X�A?�X�Bk�����KlC~*�O�O    ��Ȭ0��HYa~͍����g~�Z�\�hM��+AF�Ow�΃+4��gPZ0�%�`X��W��2���J��
��2f�$ˎ�53#�T^�;�A����A\h�(��}�:A�� ��NUW��,g�w����N�
�O��t��������Ʒ<a�x�.��g����'�������v���>�$�]����g�I���Q�^�Mg����J�����701E1�������,�����a��&���E�2�pr�k�79����A��ÄK:��+w�:+F�Ш��=�Φ�
����^�c��ݞ�H��U��.�/�E�73�RЅ�$�AB�{��ѓ�6��+>��.��R�ۀ����>u���h��X����آ�̒�&��{f7��p5�Cx+����k=<\bQ�~�{À����*�֐��
���,�C�6Ê����3r������'u��[�3'������=W�٦���O�̣���3s�F�`pon
$�Ђ�a��Ü�T��Iap=X`�1^���>1�_�!'^f}"L~	������<X��⾇ٺz���nv!v6�1w������?�F~2A�te	M��*��L`0��
W4���$0$Ar��ݽc��{�m��cVX��ޏ�S���h�JQ��)]I�t��ܭ��B��)�į��=� X�9c�2��%,��`6X�N�d��$�.H^��x����Fe��sIq��Ԣ�	�#����B�/z4S���5���	O��-�<_L����%����hpl	\f!�����ǎ%J!��BR9k�\*��4cw�+��1 �{��b����H�`���*���@|&��pIʜ�k��ɒYW��wd+Zt����+���-�H����J*}�v��x��8����uG&�����^*63a��~Õ���7�ⓡ��9�-����+��e�?�[�t�*X��'^=x����;�'lmΧ�{�Q�*�qʜ>������י���x�X��P�Obq�s���&�d�����4��"H ֻ^������&X��U;���G!�6�lUwk�\_K����B��3]ߋ��n�%S����1M�Z�a2���O_�:�ߗ��H�oo:]�#<�'��o���O�8>�墦>�l��0�MK�[��"/H�K���'ØLӐX9���Z/�T� ���^�Uy׺muvA��sjS���p��8VM��
�� �E�f�Uc2�0:Q+����F��/f�
b����ݹ/f��SU�������˨LE"�p��Ƽ��$\�ޓҕP`PA�dY~�X&p:�뎤�LN����L��Z�:��X%��}�BwU�O{4��G}ēܝ�7<�2	oc`˱�c6X��i�H���g�y�fO������	�{���)T�7�2?Ln��d�yk7�r�#��x��pODqa({���6h�$��I��F�5,�qi c�Z����o6y�RL@��Y�`�/�FY0gV�$;�.[��UN�-�:�� �a�Rp��S����{��;�Vdpa�������E(�M�R!R�"�G��꧳	�v�!����[���cG��;[�1��jX�"������{����@#�p�d�`#� X,Ӑ������l4g�	WFMa6�@��'��Ηr�.�Y�Z��`M�@�|/`
�4��ښ����,ˑ�~>S,7Ks9V�~W��`o�@ag��C%
�=KIa���"7v�b�B+�y�g��K���䥊���t�n���"l�zC�r��ؙ 3_���X�X�W���p~����O�ڰ���}�9>8?�!�}/�'C��U�2��|
���Ŕ��]���3(ή�n4M�#�얅�߫}9]��m�x�+��4c����8� �aI<
g8^~	���ɒ)I�4��{�+OWA���	��,;�)�L��ڄ�2�B��͡�f��z�ӿ�S#�K5��Cի�Ij�Zb���R�*	K���r�yz6��tk^����CP| �N���P_�N�_�`�A��dN0v��M:Z�=�#����c�@K�����@>���0q�U�r��Et��PEXԪcu��.���9е1��������(�CQHT�3�\�k|[�fr5
U5I�(q�_fxb���f���xZ-A�zA���C^��8�S�Q�gخ]�zޠаXt�\� �9�D��C!�~�����b��f#�/��Pul(�&V�,Mέ+4��E�$Z�D�NhP�8Y��k�Pc���}{Mh��Ge�]��v>j��࠸�J��ugA�ϑ��ܟ�9[	vJfQ�+d�ܸ`ؘ>a0#o+݄bNd��~b�Z�(~4��d���|sG�i��¤c+��Dj+����O
%��%�p�
ђ{�9u�B��k��2q�/����}px�3��d��
 �N�,&��.g��lc(�~�"Ƴ��4�<`镬Y�5H��97���/��Q*��}��M����Ÿ6�x�0s��`S&�O�6�8NY�j~{�Vя3c�ǫ n(��~���"��F�a��I�#ل/oj������k���_����z���:��n)��#�!<�֫�d+|�3W�G�Xu�p��AK#�j�	��\s�r�_A��H����0M:�=�x�x����1��O8(�T�څ�L�"TJ�ӑ
8��	L|�`��1#��0�SB�|)m�"a��g���B�@fD� }-I��%Ü<T�m�9)U��?�;~B�!�}N�	{3�����|��4��VK3���������.$��b��P���T,?�0�
�d�b�9����e�;^Q�0�_�+��^��P���5�s��N��'��8q�ّ�d�'U�}:]ڇca�Mm��:_)ؙ��|N�P�F��'��0������}��߶Z��~�j�Y���O��pT���݋�z��`Ʒ�)��[���)�k"Ru�,�����ܿ���V?�]m�[��#�$k�V�F��p(��L��[�Ί�߭��:�Lm��WG�ҩ��&�(����;�6���Ě/�[�V����&�E���&�����6@%=7X�̹�ae
Z��UIM ~p�b�eje�%��K+q���YH��9�T��lNW�|�34 �O8k�]�3�^�"H���*�T�XmX^?IAϾ��.E�p�eg��]vau�G6}bG Q�J��(��1�U�sF��UZ��;�Y�j�z���5�B��|��ʉ����EhQ�Xf�z������ڻ#�o>��������*Z](���#�ͧ��FK�' +�6�����6��G�p|
xPB���A�"�5��*��
��LJ���4�_��X��M/4�$��s��k���u��cw{�>|��3����&$��b%����3ڲ��o�g`{��$0��p�Z��Ҵ�8[ؘ�ו��^�4�X3+��<P�k�pf�^�a�Ϫ�&P�� �"Ⱦ8v�����7�2~�Kx�#;Y|��n��H�T$���]��^��u�8IG�vƇ�z@�H�n��l>��6L�C���ˎ�g��e�$Y�T ��\�vON�t� 9]�fi�'���|����I=ٚ�X�ԓ��`��_�m�TO�x��=e��$��L���|6#��d̎U,�Z���rdC�0�;]L'��+��֎��y��۫$c��|�ˋ����G�ώ����Y
��lUt�h��5�e� K�}����g�\,ZnB6~6ǖ��j�;jcy^g
����4�Y�T�L����dد��dĘN�4Nk6�U�:�J�� �Vv�/�/�>L�'�'Hp%�#}Z�|���J�V��G8Ő�.�)�}q����&���K��k�{sD�[-�����|����JIM�+������n���P��ǘ0:��sIv^V��*f��U�ܠ�r��.o��p�^��3�4$��d���
l�U���L~�u[l�,���$��(Կ�Ó$���3�s�GB�tf��4r1��U�
;�VA0��p@?wuK������G���:��'3������    h_�[��J	���`���;`��n�(���Gn�O���M�迫\�?c�T�����5;�(�r�nJ��б\�ՙl�z�K�#�$g��C��U�p_�7�`䋼k`�����Vd{�5W9Ko:�{w�0��꩞N��̴�tfp���k�F�JO������U�Y/����z5}�z2�3J�w*ήZ�W/�_޺��e+q˔M`����?�6,r�*�V�ס�'M��-͛�E���A䈳#5{��-����T��*�^	g�M�NeJ��2c���;X+�V�j�u/�B[Y(��L���Ƈ�F��Cǵ\*aE�7Њ�i�3��I >�J�Dp z��֝!��Y�c5?�����%P��cut�w�X0g�_��>=1�N�Z���P	 ��ot�׾����R� :���yT�?[.=��]d� �Z�2���*k���^.��ƕ�P�-�f���E'(,aޖ�׶ #@�єYQ0Fv�?$_dk�Ka��Bu�jf��]AGaC�mAj�#��_�+�}�繁�8�U%�B������5Y���j�+�X����rȪ�;,JKF�T�p<i����J�]�Ѕ�$;�Eo���1{��mX�α����c��%�ݞ��;p�9�l��n�~����F~�ƿ�ҁ� [�';�H�<�*��^��J��-�Y8��i�*/�\f�v
����(cdߌ<M�.�
�m������lu���ॻ�Z��Kw�����#{���J�M a��Z�ʾ��v:ׂ��kA�*��迎�qBx��/�xgoiH�4I�@�q�һ�A(b!�_��Mؤ�R�q��f6�u#{�I�"�����G��U�`���['��~�g�/�u�#���u�tr�lw���Ҳ�|G��e���(���g�'~]Iz��v�S� O����:1n` SY/��}g8sJ����|�I.�̂1�kL��[��ѣ�ր��'p&7* ��2Ө�Usj�wT�c�ү�(��u�hu�A�0�K�+4Y@�~ױye(�eP)�s,��9�9��Ul�GhĦ8��nCTOO(�k3���D���L��~*{k�`�����U`ԏ�"�� �xG7�3	��ʅw���f6Q�>�,�b+�a���"4�˓	4+͢�ЋXg7���g/���}��r>:��߲�:�����$�es�Φ�	Ɲ�������/em<�/��0IOh>+�5�j� �C��J�.!._X�����r=���\���5d֖Q�fld���/Ҹ쥸82��d�z��U|�cu�Of�QPV	n�SsP��䔳v��HO���~��+���|�9�7}�h���\�j����������c��6��'�yk�N�w��V���!{ U�^w�)k�<$X4)Fmȿ�@��J�UV/Iq?]��*�ҫH��S@�a���4Y�Z������ea�٪ۄ�Bc��8Z��G�0�:C�(��{ZƗ!F5d��2�(�3�1#�j�;8�Ut[O��š����5�*����n�h3��L2��}�A�/r���]E`0�Zv����iC�a��M��W2Ql�R7����Wt��F+mYg�[+�R�K�o0�����Ӌl���c�s�����ǵ��>g�|	��@���e(Á_��X4����0�t�;&�W}l?I&A�S��7�ff��D%�0e4�)[�T���}l���U�g�2�D��7Ѡ�%n��`��W��%6�pad���t��\��%�L��>�Fe���'�B>��
v��L�.:�����c�V͉Cm/Y���0�%]�0R�3�6a��ʉF5d{�S��yʭ��N�U�>`��%��%�m6�1�.o�&p��=�dW����M/�UZ�f�)"���I��ܜn(�u�����U�\J�����+�u	pP44�Hф�a�Hф�a���[w=��w��k�5)d�5򿴒9��F^~��kpRw�ɠ�um��;s�B�1���1��j�e:�`8�~a� �)��S[���s�I��/��$<��|�/��p��E
��'_�{nBo��s躋�2�'�H6����飃�r�D��B�36����!pP|RD�WŴ�)����H\�h������n�8�&�r&ܾ��e��3��%��3>�ȁ���p��E�s�s���I����D�]���9L���Լ�#���M6�3��R�H��|.?zǥ��kւ�=+�y���f�b��@�0���r2�7��?+	�3���'�[�O�oT�k�>m��[�;6IAMf�a%q�.6W��� �>�K���(j|�Z='u�_q�Q��J=%�/�t��_�u_3��-N�`Z��T>v̩���/��[�Ƃ�/��P`J{�Lx۟�`C�F�����`��k��@�XC�����^��~Zr5	��|g+�����3#�}!jY�wT�N���{����|�o���&z&�W�m^)J:�p]��:
�z���X|���mq]�s5�s6������Ø4��fɅ�
����s�������٩g��s:[Hݳ��(��>��2����%�1$o:�7����М�gMF�ZV��x��]C{]�I�j����ͳ<�n��.�
���H����i�kѨ7��E���3�AɌ��� �g����|�6ө���I��w�(�_�LZ�a7!�>�$�ݰ�0���*��u4��E.����`��l���\�8�r��=Are��w&tޝ����j�_�@���ΤK&�r��9�2�s>��Ep!NǓ�J��t�!��kh�+�{����n����L,b��AS��c�,~tS�fK�br��E;X�2#�/iX�~�N:������Ă��"`N,h�n��M�,G	�2t'#�>�"}��^Lr�F���utX�m�Y�83�&
� <|��Xh�syl�R}�`���k��GP+�1�T�ӿ�J���c���p��}����L���-C��C'�%d�����SBV(�q.�YU�La��\�}Mau��+q��J|~�H(��*|�d��:R�(�-�lqwE݁���ue�����8��k�vQ.�C@��$.SN �kuz��ݳvb$�:HU�K����9p��s��hҍ��3֞�_�i1#�m̼�u�63�-3�qF�*d�t�����l2�v���Mp*ު�xKC�NW<�A��%7���=_Aa�������M�n����P���}c�0g]3%��c�^�ж6jUm�� /F�"bۓ��f����-�O�CÑ{9;��_�����3,�޻�>nL2`��.~ᄅn�aK|�PU��]�
��d�sޢ�oԕ�U�~��a��`hx��}-���q!L^�%�C�5���:u��q9l&���-�\�y,t1		�I2<���0�ٯ�;z-�:)��
^�g�sNo*Vx��ۦ�MD$�D����5�i�l�6�=0�x"���]^W�>H��͑�؄��a�]��)g������j_����V P��^�Y=N�ٰ13���0c��U~��xCa{Σ����P�� �kd�u���聁��*�ؙG��lsmd{�&nn�'Q�M#7�q�j�����{иڦT�$v�$#����Tp��r���чJ�$<[9�V0nGܧcP+uX�p���/�blJ�"�|�&T��/���R[�z]Ij)��|������cA6�@1�O��S���F�%�����76�	{�0��n�L���v}�����O>l�g���;0��ԁf�Aw�u/�L�*��aQF����+l1|�n��jf��Y��C�ʑ�?�X:AmA���-�n�]�������������S/�l��x�!;�v�P�j�xK��@�m�S��["�l4AFH�B7���8��ҹ�#�\�K�{Z?!�xWY/�;}��m�+�2Mfя�ͽQ�h��VG:&1A���:_���V�ؠ]d2b�e���I�*��wp4�������фqAP��^�B���毢6�<���<G��88���S�����N��    ���UIN$�.H^���VO�~��:���|� ���5�Z������$t�YB%n�E�0G�5��4�]�
2�e���W�q5�h�r/�� ���o���X�kˁ�{�GM� ��c�ɫ;��Sh?�/'���N��ɲ�,^�m�P�h��Y"���_F�-7��^�<�
�\)kU觼/f%N����r�����2���q����n�o ��`"��*-���͋���N�������)��G��:�<e���{��r-��.B�����nxF��4QŞw8�Qžwn�gq~�5��f�[Ĭd�2p�L8��ތ�׮q2�f��{����� �J��р�ӆ��TA�cM�M.��Ռ��*8�᧞����Z=���L3��Z��/Y�Q����7�/n�1':��PMk>�R��'5c���[x�%�Ax��A	g(j���]��ׂ�5B�vN�����&��M���2&�o�ew���mR
<�����,��$�w��r]*��<��
�\��6}��5��CW0�V,4�
ae�L���s�>_9����0ߚD�<ԯf��&6�˅�?�O	B���H[��L�W,|�.��be־e�TUc}� h��k� Ȅ$Y?H�'�ӥ̲M����"�l"k~n/`![��IƓ�;/�± �*�`8[	-!����pvI��V坧���)�>�:YB�i����@�NRi�6��8�K���M2�^�#i:al9����Ng�{h�k�a|`�����siib���c�I��׆���}J��RTc�Ѯ�F-_�]$K��3a��䨎x��H��*\p�'����e0f�)�x�����>�����V�I�`q��_U�3��ϞY,�)��>с�/JP�����b�@\
�Pu`���*���'���b�ڜ)�� ��^�Z|�ąI��!0���ş����Ǆ�����4ѩ(�5�ꠊ,Go�zf�|9R���z�Pk����1(�ʙ%��A'tT}4��	���^8�Po�%v���p*P5Aܗ\2V�&���V��栯�c�e��N@��;%EJ{�S6�37�/��,u��>V�X�O�aȊŕ���a�J(��OĠ�V���׬��ľ �/W�Si�	y��k(��3��+Җ��r�1"��;�{���\g��O�;R��{�]6�	� �$�ΡE���^I:��f�7s0<�������[�j� nM c��NN�sDz`��5��M ~n�,�Էz��xN�,r�;�be(�K-i:�[�.��;)W*i����Tc�4����|j/!PF5��	Q8�u�a�k�ik�q����Wx�o�Ջ�5�p�Ó3t���3TE�����> �1q� Uu��wL��(ߘ�i�;��J[��!�O��RY{����o�sb�o���

<��Ͱ�����47a��[�U!�� EX�V���Ȃ,�cQ^���3NJR��[���T����z:Y��L��:�TuM��	?��¦[Ē����x߶���QP3^(vB�|9�nN��'�a;�m�0-,�fޕ���cn�c�������W/,;����De�%�at��R��pۚ�U�)�'��F_o�1� q<ۖ���bPl��]ɤ�[o�
�`�68�s!n����cjb!�=ρ�*�;�s�,y�G����*�A���@�dM~T�;{6Xg[u,�5�lq��?8�
�:��F�b��A��o�+2��(������<���:�f����c��ϱ��"�O)�9BfQM��,S~���0��]�q����;�Cy�
Lh��C�����Eg��Vי�������+�h8լ*�y�!�]��ʃF�|�L��e*���������.�i�;��|`�H\��>[��߆Ѱ�F
4�B
��9䢀��d����)�aA��`�2ȃ��Y4t9��=%/�E_��)���.J��5
�\[�[T�=�Χ���fORp����wU��&l���6����.�P1|>���P��Xb�O;syّ�\}jg���ٵS�+~�Ԝ˜�d�N�Bt�n��<� �Iזӟ�7��N K�m�m���h(u�2�&a<�Ϧ���n��l���*4'#E���3\p	V�W5)�4��E��{v��LK_����r��}WS�ҵW��	˻W���C�%m��B
1�߇\q�[z�Y(��<S��D6�i"��Ԝ뭁|;C����:V�m*�,ŷ3���R}�4�.���,$2�VJcOg��8�4�z� H�	��h4a\i��m�0Gyp��[=��	�'���)�QN�uD��?/�G&����	㞪G�i`� �.�@���k��<����Q�elq���	�pD�7޳�.�X��n��*����)��6Z	ZYJ�f��j������=�К��@G\.5H���Y��Ѱ^#9	^�.�<��ΔS����ک��ЫS��:�oΛc���L_dq�`�BYt�U�<M#��=�xݴ���8�uܲe��M�&���1D=��3����|�_��=[(r�Ǭs��$cֽF����}�CZ~VǼ)�-���9m��Kr{���|��ύ*���[�+&�]d!ۧ�L�n��$�꣈6B�uUg��ɵ(SU:XP}M�*u�J�-t"%D�Ԥ`���d��mA�l���nz�4Y+�����鄉�Wro��X��W7�Q~�SFZ�8qS�/4���� ��f���� �@�:�a�k�W��,i�BƁ�9K�l\9�Ѡ���t}Į1����n�_�c�>��
fURw!3�v��4�k��R���ZM��,_��d>S�l�����������i�l�K1OR����r�ߜgʳ�8`N(_{gI�����u@�\��qaq	o�M�s�8"�o��O�����Da�������b��_��_N���tN]X{,>�>�2u�-��/v��ߑ7A���{xhꨟ�TY��#��F��������y����_q�`�%��A������=���a<Pt$m���l"7jW�T��5G	�p�ڎ��,�,�U~e�<�P���L�S��gK�,Cy+Q�X��g؍a�>��i@���SщT��1[�k+JN�x�J��y���M8-�pB:ӓV�_l�,{?ۙ����!�T���2�����̎m%C�ݖG�f~2�h'��B���=WJ�m��l��Ʃ}�d�T�k�X������<"�V���^N�y����\Y�#+=�7�Y��Wa��N��Y	��PbDkB��9���Q������K|}o����� ��YIO/���¤�u
ŏD�v'5��\����ߍ0Gz���~�5s��(T�ʞ��' ���� 5�C]�NЦF��#HS�S:RO��Y��f7A&�̫�sq�j-X%��b�Q��)3��ϐK_.e��]é�V�M{!��#c��*Rj/^�&��h|�Y/�cof}*�|r�u���S��thͦ�tvmFS��c՟}��
�K���}~踰8�_*L8�wd��<��=��k��1s���G�1�7�'<l�`4�:C��8g/��Yg�*o*��0��XԿW7S���Zggd8�{�A�!	�2�cF
��F�li0�~41z�p��$�)�d����B	�q}�o3�l�e+�Dr�_�C�؋��,�[��
U�m��n�s���d�Yo~+��k�4�@����PɈ���H��K�(�oڸt�K,��ZU�W\s
P�3vA�jN�d�L�A�]���h&��5��;6Z}�X6���������>��)+\��F���������1�Y��º�X1#X�~Wi�`����;^��Q'3A��Ď8^�8�a0�<X�u{f�����4.qN�y]�An��1��M��ױ��a��S)��A!��M����yk\�S�MT��w<�(�ka<=�Y��ν��I�o�@��òWa�׎(Dr���k����J�d�tf!�Y3v�-9=�c)�d�6��*��Y�%�-����^�O�\�����m����>�*��+��Q���l`¦=�1{g͌�a    l<��$�Yl��L&|r�ع&�׍�k�1184_?�!e��K��M,�QkK0��VX��g��8�zv���5^�0��u
�1��6�k.�<����fXga��倃�$��nu�H{Zk c���rYsr��=���T��'A�z�����:�����N(�l�pS���jwћ��z�hpl'��h&-im_<KQZ��Qz�O}�T2�Д���:S�����0��O�-|DBS��#�k3)�ϔ�C��	~�	1D��~3s4fǥf�S�@�{�^@1��)RV��Ц�_0�M�<�L��`�_f�Y����\��z��*t>��eK;���5Q�x8c0���S���\��;���K���*�C�F��
|�]������ê<�.���i`�I�;{$Y�,���e�D���)���Ƃ(�k�yu�3�l֒c쨀��81�!���Uol��"*:'Q��A]�B�E�S�G��;�~$�^���6���OF�$����i �����`;K����p7;m~$<��Λ?��ڋ5�bJ��̯��?Q=;��%aD��8�cg
����u��v�*��o4�����!!�*!l!��mpȩ"V��[��9�#H��y��#K&x s���Q�����Ԭ�Ǿ���j���OȮ{��㢧�U+X	��2�F�8����8����G0\#DX�B�6Y����:[)�K�����\�&X�lI�y힉�Z(>	"8�$}��H���,U���AZ.:r�3�8�B�mr����|,g%?��������vp:a�J%Ǯe�1K&Yrl��~J��:J��Fυ����&͔-?0��N���ˮ�ln�� ���Ө�3-�Q%��Vq&����L�ً}f���vn�8�Ȭ��ҵ�虥���0��.ӫ_8�H��k<ON�⽒1�w�no��&|��P\�ؓ1�:d�,�� ����K��а�3O�����U��q�/P\��[��â�?_� ���Cݙ�E��C�;L��jN-;E��{�WeU�������#Z��j�L�c�/��1�����������;Y�GWp���b�7��36tP�Ƽ� c����G`�O-�R1��K�-�R1�k��&���7��J5��co�J�y��۠����*�e�3hYp��3` ���0��z� �N��^��i�7���=5J
�= ��HJ�q����*����h�V��r�|�2�'8t<C��P���Of!Α�.��,�Iܷ�d�A�v�瘁j���A8������N&82�ɛ)�g+@(�*uzKd�e��io�\���"%#ka�|JN�S�\�QV���Wُ��P��~���<������+�?06��H�;gv���n���4�o�V@�N���	2�����I��k�,�9�r5�5/�.�A3�+��0ŘGD�4��⾖�Z����1��_s��O�r`�-��>�kj:�)F+���_,�!��|����ҫ����`:쿵a5� gù&S�[��(Q�[Fq�@�Ｊ�c�ά댇��6��7���<��p��W$ZAb������.kkrˣ?v�<���1Z~���k�s4� �&�5ԍ��V
��E��Ɠ.��ȹ`Mа�s��t�k�&gTr��Mgܘ�#������\��b̑��y��.g,��N[��HɖMz��,��@��0�*�+�����|�$�/W�f����%�pRnv���;�?//I�d9U��3�"� ���l�-�fGmLf��lN���B�n[s�^���g�:�Z�b�NzFƊ��	޾�	Y��7���&�i�_bU]��4��@%/�u�{�A��1?v�u��3�
UH�'tm��K:fU���g�My��:W��T森U8HB�f��~�;,�B*�!��wUm-��O�@c	����9[2�?O��tЖRO�	n���s�;�ng�4��3��������gY�}-g������	_�d���Cũ���~�=Ѷ���>��){Ɍg)�{���-9a�`���a�`y�	n��N�����Z�_���.Fih�fG-�5n������]��B�̨��Ho�. �q�� �#n=q0KK�3�_�a/�c�[9mH *.��
�:2`�b-B�i)e��	�6-�f��h�\(��7�(�/�����FW��lL�������
��uL
��f��&��A�wu��1J�"�3J�	"��%Q/�Mb�N{[��f�N[W�d�$�C��a�ߺ��ߩ*��ؚJ�_���s�����Q��X�|�U3KH��FT0țoIK�Xm����x�o�rܗv&�� vW��K�g*��}Ƒ�4�o�PG�MQ[���k���k�=zlm*��X�A�pQ}<V��s��>P��#/uF�A#ZSܹǢ�x	���V6Z�(��g��p�d�a����<�����FhXjÁ;��5�l�>�љ��� �4T������ӊ�=V<lZ�A�}���v�Ku\Q�y"fǈ���*[�)�"Zԡ�u�hQ���t:٪�{�	��P�ua(K��XU��L�Q6<���ۇ�Us]mh��tq=\7��L�����\�4�ϓ6�G�4�:��&|��$�p^����N`a��
����B
��m z�0�'����KD(�F,�bSU������;���M
��H�N��sJ�X=�(�a��m��JW�H��-C�"=�'�sѭ�N�p�-|W�CS)v��j�h|�U�A�">��[1}n��H����P)��9�*(� ��/����������+�ߗ�Y��$F�%Ɇ#��U�N��ɻh��Dދ���A�:���Ɋ�t<1��%�8eC��<��ǃ|7��:�n��	�Ed���?�8Vŭ�W�z�IJW�C�r�R���噅\�52�~���Bp1��G�_Aň�"2�ц��y��e����R�y<W�`��W��]������zc��/&3�1�i��6?��X��"��!x��JB�I�%�2��yz��͊��5�qe`�Y4�,h�~���-�A�g�[�c��n�1��Nwv^��`�Y7�6�v��k�EU"��m������=Kd��@3�C���QO��&ᗿ�tOH��	b˝��3��V�9�{�x8���2y��7�c��y��'�0�����
�6;��Y����i�����z�|�<l;�V��ö�ɵ�:�F�fp����b�Mᜋp�
u��.[��+�At�7�<_5OU���K�f�5O��z�2Na�T�ţf�g���1��sƉ���%3�A��)I�<nG�~�H2!Ǟ����&��f`(��g`(���m)�d�ب4#k��f$
������-�	{b!�X����g'�"�G.կ�q#�l(���
��R*D����
��b���
u�T��Y��C!G��V�(�Úg,Y��������Y]{?�&��3���팗	�6,`m'4�[����
B��.�g&�T����He�&bH$��G��l9��ϧz����ϧ"f����tj9�Z�=�&�0�L�^�j xn����FGV��O��K }��ױ��"Ý߱{��a7�:�p��M8�!������-�o#��k��A��,Q_��Z�����V��5��y{_^d�����A{nL��A"�&��6����3y6�ᬉղ�J�q�
+��>�&�^dV�r����m&�z���%jM��I)Ȯq^�/�[>;
؀~�VY�	� 3� ��(��&6��Ä���y#�_��˅+� �@��g D $ɞ筬yr2�)�������/��5a0����zm+v$�:�A<ڎ�[bN����w��Q"��}�sƤ�B5�F�b�9��w1שT�#|��y���t��;�S��.�%�^��,��T�IKx��Of�@�n�jZٵ%l;������F�����*���x��ݖ�c��o����
�l"lP�o�Wݳ�t�f2zI��5���M�Q����Y��8�2^�ݥ^a;�H	C�GB;p���U�CΪ�1��Ux���F-���Kz�����R�߼�2+ 2  /��Kz�|��4V��|��&��3BY�T�>�ǜ�q=g��~��8���dwv��.��K�g�n(�d��m�u��&&��n��N6R�j�HC���'}��r'C�.e��f��6�N�c��n`؝Cyr�l�2�J����穳
�����,G!M��z,���V�emڛ@�)�,{��*6��C�����K[��:����zx�^�(�u��J�`�_�!Y_�4�Fnƅ`ְ8��ν8��眭���em�u))g{��B�J:�ʫC�J6��_�&�c��9��/����Z�"��`0e{�]q��۞Y\��8Tq`�G���C��B���!q�_� {U�Aw���!r��-Ww��7<�T�)��)A0E�r���ɿ:���h|�6݄Igly���vF�_n��P[!��*�T�ݣ�fhp���ð���ang#-�s�9��)����9�$a��O6�y<��fJ��)��0��������B'�i�y���B�Af�fXY��ǮR����vU�����.����[��&�삷�#PH*���	x�`����Gg���:�t����/f���YG��F���6_�Y�X\�q�=�i���8֥�߸��a�t�F}b��=��zjg%�9��*��*s0yV�x���U����C_n#��N�ER�Pҽ�K	X�����?��yWq=��M5����b����YN��Y7���8�H����_�A>�j?[��>���F�W���l����E؂}O�l�c;�p�DJ��7%�K�]N��D:Q��ɷ6��jP��-����L��l�[���uŜ��G����������Z����X=|�i��/���YoC����ࠂe>��c�O=Hv�J�)ԤaO$!g[t��ٱ�&LĶ�;,�ʲ�Ф !:þ�d��{S�޷-+�L �OAV�K+B�ʘ��1(v��_L����L�֗�6�D��x�W+��,u�Q�٪��}c���k�y�l5�Y�l�xP�=���PQ���<������kC4��*c��3���2V���d>�\>T�?G�'�柒��=&�w�T��ܭ�j�YB��~�N�X�&w󸌕f����''�(x��iϳ���
;48���L6�bSv��z:9	�D�2r�ʈ�C��˹�O���NH�x�o�o~�qL�Yd�/��,)!�����e��)���l7��u���O��u���7?d�F]~�7�61xI�q��6��ֲ�/9�i�;^�+�8�0g������Xx�}eN3�d�����F�Ӡ򯓷� Z_a"��K��`P@s����,���;)[��X��S/�������c��0ɣ��z���ye֖I`Y�;���a�T�������	nO�]����x,��+��p|)I��$��qƇ^Lѝ����0�a8>3�P��ݞ��/Ux �i��>o�K�^��>8p�����l���8��&��v�]/��W![ÆJYP�d�{w��䌒��&�3Z�l=���W�4�5���Z�V�܏N�^ϲg+D����#���F�p{3���/�����`]         �   x�]PI��0;+��i���M���E^�hj[��H_?A����HH$�����+�SEz{�U~s��}{xz3�t�y� �m}*(���o��U��d'�N0��@ɑW.��M�z����J����E��4<�yV7���r�R��?�t-�	v����|}AG��T��b^UN}�0�3���5����;����Xȃ��k�l(�Md���ܦ6=�a�'��6�n �1d��]U����|     