-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2023 a las 19:05:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alexfruver`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocarritos`
--

CREATE TABLE `productocarritos` (
  `idProductoCarrito` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valorProductoCarrito` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productocarritos`
--

INSERT INTO `productocarritos` (`idProductoCarrito`, `idUsuario`, `idProducto`, `cantidad`, `valorProductoCarrito`) VALUES
(20, 5, 1, 3, '6000.00'),
(21, 4, 2, 10, '70000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocompras`
--

CREATE TABLE `productocompras` (
  `idProductoCompra` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valorProductoCompra` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `precio`, `detalle`, `tipo`, `imagen`) VALUES
(1, 'Manzana', '2000.00', 'Manzana Roja unidad X 150 gr aprox', 'Frutas', 'https://jumbocolombiaio.vtexassets.com/arquivos/ids/203311-1600-1600?v=637814194198130000&width=1600&height=1600&aspect=true'),
(2, 'Brocoli', '7000.00', 'Brocoli en bandeja', 'Verduras', 'https://jumbocolombiaio.vtexassets.com/arquivos/ids/209211-1600-1600?v=637814209992700000&width=1600&height=1600&aspect=true'),
(4, 'MANZANA VERDE', '8000.00', 'MANZANA VERDE UND', 'Frutas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTrkpRDZW8FZqch5lV97qB3Fk7oXRxtnTUPxr4bDrxhqWhx_wdjyaftYrLbS7FPEdSuJH-1iQf_lqVt1ydAyVQJOLbZMB5G3A&usqp=CAY'),
(5, 'Banano', '2500.00', '1 libra', 'Frutas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTpk2SAhvfR6rpmarJRmft0lfxIzQchqGB71C26UhyqsLz8rkOpa8R6ZwvsN_5aU76XwpGOMy1DJh0sMqW571R3Imojq4w2vzoW0n_0alcfnJqdLvrdY6R_Iw&usqp=CAE'),
(6, 'Naranja', '3000.00', 'Naranja - 1 Kilo', 'Frutas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRGQHaBXvnb9WUbvs9zkfqSTJtYbqbTVUwgpr8_iVQwvSRL65IcRwY5K_hhgBYfCXJkRVmOUROtYnyiyfEE4X_dIg7IavNhhKyQGJs_5qU4&usqp=CAE'),
(7, 'Piña', '4500.00', 'Piña Mayanez Unidad 2 kilos aprox', 'Frutas', 'https://mercadobecampo.com/cdn/shop/products/pina2_Mesadetrabajo1_1024x1024@2x.jpg?v=1594396915'),
(8, 'Mango', '4000.00', 'Mango común x500gr', 'Frutas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRuUDng4y2M-b8bay6zZ255dYHvZ_T-iYpzMcK1y9CVmRovajyQqzOyyssIHWPJQ8BXYXPy2kUYcsLaVm-zTFywkPbutiFnKejTxCVnxBYaUG6SDz7I8yRrXA&usqp=CAE'),
(9, 'Papaya', '3500.00', '1 Papaya Económica X Kg PAPAYA ECONOMICA X KG', 'Frutas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSQJY3ul4DRA2yogLNESF7wo6UbxyNSrHkWUz6bMtrXRBqbg3yMvb9qYA81wndyipFOWEsDvgOYImRWtAVwv2DVNfCS7K1OwySaAiwKEIjh3EtFwA04T0BE&usqp=CAE'),
(10, 'Uva', '7000.00', 'Uva red globe nacional x 1000 gr Uva red grlobe nacional x 1000 gr', 'Frutas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS5rK7qB04mAwN3IwWLJPWI0W0goFv5V6YzDlUwHqU56Hl3rowXabHdfLMtjxnNLnyfYFLFkqHLagPLRHOatLIfQTVjb_tSBivEXWUUmgD7ROvpJAoVYEtvtQ&usqp=CAE'),
(11, 'Fresa', '6000.00', 'Estuche de Fresas x500gr\n', 'Frutas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTIJxG60gS5xxUaaiANzOqBUVHzoHzGol8J06291PMKvCrRT8YchL2vrW4fRT5LbwSJo4SKUo2-15BSdJ1CrV77bMFYH3p07kvnFkaNxHWSo4-8BuE1CgARcg&usqp=CAE'),
(12, 'Lulo', '5500.00', 'Lulo Económico X Kg', 'Frutas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQVKHk4QcxWo98mI2DcaavayDqN8HEGKZZ436ZaB3hwuQ7CjFsOB7fNM_4obHDef8N5dYSo1A_3ofXZ8xZETH1oLbtZkvg9fa6cijryeZS1Z9YMG1wsOWI__sc&usqp=CAE'),
(13, 'Mora', '5000.00', 'Mora x 500gr\n', 'Frutas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRMSqUK9Yk_1gJOo9afKysCZtxbNOw9MLpyvKIUjZOjn_-fR8sbaHRr682G57Rlh7c5xbiHPhgxYTYQLitd4Iq1ggoduQavUO0EBDoIMFe_c4j2DNehlDGY&usqp=CAE'),
(14, 'Sandía', '2000.00', 'Patilla Blanca/Sandía X Kg Patilla Blanca/Sandia X Kg\n', 'Frutas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQExEBRUtoUZ9w2psJmSUHgOiPlXiLwSpN_c2UnCZ-ZOZ6xvv7kgsikpTFgiToEKQWPi8nm_Ksq-tasfGsQAImD3aefYzk6vb2Y408tLWhO0te_ZxYgwC9sAwSk&usqp=CAE'),
(15, 'Melón', '2500.00', 'Melón Amarillo x500gr', 'Frutas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSXSPfxWRuoiI34I8Q9Mv-kG85jOZAzC7ffewGMwrzMrZ5GeeRmLNfOYrM7D2SbvaM8qEmBIsqf5W0-_zpABopqBJl1Lg5cUlGJbgZyPw8h-lZKpVn1kHyA&usqp=CAE'),
(16, 'Zanahoria', '1500.00', 'Zanahoria Primera X Kg\nZanahoria Primera', 'Verduras', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT3zaAkbvQpkhnLLs5KDWXDb4MkR0P78-oldoqvLDrLIcasAJdHsgrrQph5zATIwqM1_7ibb4vP_Y5Hd8N2gmS2rqIIQ7VU5t3Ctl0fOw7pRL4g9pAH-vD7eSY&usqp=CAE'),
(17, 'Tomate', '1800.00', 'Tomate Chonto', 'Verduras', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR0AxZ7NUfME0LjBfvGhLheEYje-4Fg8ql340623X5nOp8v5BTIBWyo2e0EGZWHFwfmzFEW8p9r4Z3mMP6wV6cMeQKQUZX1Ze7E2HEYu61WUBFgOriL8RIkGQ&usqp=CAE'),
(18, 'Lechuga', '2000.00', 'Lechuga Batavia x 500 gr\n', 'Verduras', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQIHxb--OoZjxFC8fZXZMmqHgfW4Tm-NtfDBiFvnuhmv9uBxIwKhH0gOtVSwzfpl7V1vufPlBWQIUgLGcuUg1Z8uHsJX03vR_BneW-t9slFwT9FH8Rq_2IPOg&usqp=CAE'),
(19, 'Pepino', '1700.00', 'Pepino cohombro', 'Verduras', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS-u8x6Kvt9ptpEKtR-smDFM0iiMcS_K4eP500sHJOHA809uon2CGj5DYlXbxEXRf1qmDxCwX4osJIIg4a0U5m62zzKsmr4ciL24OqZCl-GnQxkI6HMA4YzKts&usqp=CAE'),
(20, 'Espinaca', '2200.00', 'Espinaca x 1000gr\n', 'Verduras', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRdf2xG7CMol8LKYnFjWJRfYWNsG94dUgLDjTvkdqeZPKeZHVMTd2DjBzRIXNummGhiGBXSTrPgmwOJBJIUAAijQOp_togCGv5jNuKObmJb&usqp=CAE'),
(21, 'Cebolla', '1200.00', 'Cebolla Larga\n', 'Verduras', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ8UYaNg7-UorptVZ21mUq485Q-HYdaJN0f8IcWocSfk5uz_SjLPf3qNx6EnqFpKB77BYJqVB3r3R9mo93uuikn9kOyTIq-fLFdUfNDh3ijejN5i75HyxZsFw&usqp=CAE'),
(22, 'Papa', '1800.00', 'Papa parda pastusa x500gr\n', 'Verduras', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSMzpFnWL8ixyK4hsdpeeDpzDj9KKes86lZTfWlTrPkoy4eaFkK-P8q3myqfFvE_uPV5SNZ5XyZTJ7y549SEgZToVUDet0M6R6LbRpYW5bFfUOQQdtU5rLP&usqp=CAE'),
(23, 'Brócoli', '2500.00', '1 unidad', 'Verduras', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTBH8wvJjEyz9PfkNE5cNl1UVF1i-iw6gZT22MV2Bru5zhx70gj8KASPG0CRz2x_ieA5YVIMUUAYia5JuGbC4HOYhhXPsjRytANFOno9j0N7WX7i4utFQCYR8wH&usqp=CAE'),
(24, 'Coliflor', '2400.00', 'Coliflor x 500gr\n', 'Verduras', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTm6HOQTsKC0Bi1cijNt_zrjyyf6HABLN7pcQ6zOXI0FhqTD4wqpzZSWLKW5t8s6eRj3bztAyMiHhFDcbVU56VfObzoifWWMCxhQwpeZFw6vnQAFb-9yX8g&usqp=CAE'),
(25, 'Remolacha', '2000.00', 'Remolacha por libra, fresca y de la mejor calidad', 'Verduras', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRvImBvoZzK_BfTVMoiTl5QJXqr3EyBqAcsVaY8EUkSOTEgAKbxftn4ib4_-2peZb3poC-2qwkTJ6h-bKRvijvMbhSY3UD5e2jOyOwmaphu&usqp=CAE'),
(26, 'Calabacín', '1600.00', 'Calabacín verde x500gr\n', 'Verduras', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSaLqb48lwxockI8IgM1cDXX9tKSy7v9YTLnwDfNBRCK9EuUzdHvJxY_MrNa_lj1BlWBHFTdqgwaQJSgd0h_9hAoH6vxaKu0118aHHywOW3o-alI9sVWbxUEw&usqp=CAE'),
(27, 'Espárragos', '3500.00', 'Espárragos paquete x 500 gr', 'Verduras', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQWAn01oWzvHmLzf2EVPUxtncGdukpQpLlJWTjSmqpm_92v6IjIqJsq3093ur5jONs6it-zPqlyVgzoJOde_lEhp_j87sJcrBeM6nYUeeYo2McrL1sPaxJD0Q&usqp=CAE'),
(28, 'Arroz', '2300.00', '1 kilogramo ARROZ CORRIENTE A GRANEL', 'Granos', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSeDYC_SlwfAW0YkCIScm4k3lgnXE_-yUjst_TspQNU5FDgmoejYr2Gw7LSm02rH5DNlBORqBJqYkyFHfO267jy0eVimT5YIg&usqp=CAE'),
(29, 'Frijol', '2500.00', 'Frijol verde desgranado x1kgr\nL', 'Granos', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRoo-icuSWAGRZnBG9OFZy7veA75RNqbroMhuzgHsUX1EonKi_k6Je4ddj5vq9yoS9kXg_LS28N_9vrWyF_LK67tHWP0uK5qRgcSsSFtbeQhAhyJi-K41-O&usqp=CAE'),
(30, 'Lentejas', '2800.00', '1 libra Lenteja a Granel', 'Granos', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSCMVlPMzpC1P265LsZ8Ckti01coc7wl8Y2cGdUYDiz7QizIdE6L0hKZamctAcRH04NP_DMk0BUYIp3wlWC_jZeRJ-EqWpR&usqp=CAE'),
(31, 'Garbanzos', '2700.00', '1 libra. Garbanzo a Granel', 'Granos', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQUk-MxrULJ2fGiv0J1DUqNhuK-7eGAIWqIrkfMq82cmJlMCQXC6LafCahtvQ_d2zPj4-ZZWxjb0mzv7qL7ST4TU7GAnCtyAQ&usqp=CAE'),
(32, 'Quinoa', '4200.00', 'Quinoa / Quinua En Grano 1 Kilo\n', 'Granos', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTrImvXXb0ZianmCf5R0YZvdkVI1sYUsORlQug8NpxvJmdpf0JhXOtCZho_Q6omcIE9q7gYlb6GkGd68iqMIjRq8OMMCfd_C9yySk2Nfp4bQdp09yZRFkqsFw&usqp=CAE'),
(34, 'Avena', '2900.00', '1 libra. Avena A Granel X Kg', 'Granos', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTyTDw-K1o0kLN6gqLP4LSIA-ltJyFUz3xC3A4VcLfvyn479M0g_Fspvw2xu7GiNkpAFm1iMxV-QjGxzfo_K2CcMcmJ10PwwXYQ-y2YvkPvv3zdcVz6LWI8DA&usqp=CAE'),
(35, 'Trigo', '3100.00', '1 libra. Grano de trigo 100% natural, es una buena fuente de carbohidrato y fibra, contiene gluten', 'Granos', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRBfzYRgF_bb-vgJLoBvsuUOGbRF8W9WJ1Sv5X4lbE6Usif1mP9s8BlQzS0pVa2v-DssXS8PmpCKbqa3busXQVnUYhVD5s2u6Y2sJeHP8cq44s0JjOsbZjO4w&usqp=CAE'),
(36, 'Maíz', '2400.00', 'Maíz Verde/Choclo X KG', 'Granos', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSI3uDB_dXdQpwXm_1gFlFJCPyDEwIvShj46343FqeVIe4mvvNT7zwpFg7qdkzEeCK2ooIqAGNleotTplWGW-5DwMCv-Qw9&usqp=CAE'),
(37, 'Cebada', '3000.00', '1 libra. 	\nCebada Perlada - lb\n', 'Granos', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRSe23NttYt1YAoN0wOdzdlfcxD0bjtd7_3dhwThSffpb6hMWAaZfPp7WWZHbmccgwWT_bJOPqTYSWlZjKQhnE5g2avA1gu&usqp=CAE'),
(39, 'Fideos', '2600.00', '	\nPasta Fideos EKONO 1000 gr\n', 'Granos', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQp4oa45NqTDRJTEbwxyp5rwwwhnuZrEwYmTPnxFrv6w_55mbIemgyTcdyQHUNy_RMD7uZQ6ypFPms4m9LGTtmMczuBTvks4QQoBvCmZuS3UHEqAxhziYz4&usqp=CAE'),
(41, 'Cebolla', '1200.00', 'Cebolla cabezona a granel x 500gr\n', 'Hortalizas', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQf1LdMhl5yIVRSNwPB7B095-rstixPLh_6U5GPQVMIbyzo7ftJ8U3bNNa9BBfn_eGeYtqyQTOv1w-Hm5sH-vT07YGFVUsveS7SoD6A-SuUCUYpoi0FE_P3&usqp=CAE'),
(42, 'Ajo', '900.00', 'Cabeza de ajo, unidad de tamaño medio', 'Hortalizas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR8U7oamsxwLXPG0NzCzoPRTv8jw_4LEqApoJ9OoWBYM_46dPF2XZxAH1usOiLtdot6GtSIdgm-577MhUxDPE2toUaFfX5kCg&usqp=CAE'),
(43, 'Zapallo', '2800.00', 'ZAPALLO ZACATA X 500Gr\n', 'Hortalizas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTQ4El9pIifbG71HkAxdLZgDhaL3v1_sYsfCMAKZ6yWTrdb-GTGAESmPb9WRUFR8QnoCHSL78DltwkNvsUwFovzrKexQUycB8xPABRWQAM40I34U7_l32ld&usqp=CAE'),
(44, 'Champiñones', '3400.00', '	\nChampiñón Entero Bandeja x 1000 gr\n', 'Hortalizas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQSWY8zqgGjqnSU9yAJU-6rtFEDrH3eppBKLU5VvEgUFdt-bVm_fIwOirtyi8taSQ_i6O6bjzfDeQ9ndQdakytaHYOAxNQN3-L1Sd8QZ372kMRA33uYTaNc&usqp=CAE'),
(46, 'Pimiento', '1800.00', 'Pimenton de colores x500g Pimentón de colores x500gr', 'Hortalizas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTj6DloFs0JFlDWv9ODuFEx51RJLU8YTXUKkthIfGLS8rp0ppbOxdhl7R7QOi8bQvsP-KOgK1JVDEeJ_6CCfbXTHNK-YnuRPW3CdkkHwky1Sm37_pSzE-k7Ydo&usqp=CAE'),
(47, 'Rábano', '1500.00', 'Rábano paquete x 500gr\n', 'Hortalizas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRwe8xMyxJ7CKM6ykww40yRIzw-MAJ2bolgoX-7E5-YnocAJXdPcsVSl-f4yzuz8Abw3tno7xyf3k1RxPmqrRUkZINgVGnx0G7mVAKfno7WnQcfWNdfsgkVbg&usqp=CAE'),
(48, 'Alcachofa', '2900.00', 'Alcachofa x500gr\n', 'Hortalizas', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSOXHjUbSsJvxF_2lvPOBUciSeQitv2fjnLnfGmJFYyI4oPuL1TDPnVCd9mOuwUxXihix3Y8WNWrVYUPx-mWp6T52vEXRO-94AymayMTxi6dMbV91CTJ8HK&usqp=CAE'),
(50, 'Pepino', '1700.00', 'Pepino melón x 500 gr\n', 'Hortalizas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ4HByLo1il5MssIn7vHM1rMWjHpz8eiQtyXchAvS2neTjGkfapTHaOtIlnLdWFD6VvfHYLKUTUkYxLhllgd38UmtPgIpaMLnCupie8KFfaOCd_SHd0d0IJ&usqp=CAE'),
(51, 'Habichuelas', '2100.00', 'Habichuela x700gr\n', 'Hortalizas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTHdir-w9E8cJch_NrebqNuZJVShZENA-JH_K3BnP2UM0M9NLHHJ776-wz1Sjkf8PnhWH5_3D6rI8KF2LTwZyjC1RVFv33hkjhGAdc_F0oZC5_hM8heaagjzWk&usqp=CAE'),
(52, 'Albahaca', '2500.00', 'Albahaca x60gr\n', 'Hierbas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRBrW7fxjL9E_10IpY-6oy0VRul5We-BI_Z6skHQMor5cFDxvWenkJwttnPqw8qAmH_8h8NkxDH9-APCTX244O50bwSHhAAiP1GZW-z_ukfz2KmPwjMXDPeGMs&usqp=CAE'),
(53, 'Menta', '2000.00', 'Menta bolsa 15 g\n', 'Hierbas', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTC0GCLrhmhbOKJH3V1Z6d80Jxuj6BwnlKx39B3_KkMqB6K_tn8ojxmv2O2NRx3xROnlC8R9uON_ME9S5LUkSFsqCphMvr4syp7XpafDUz1DDMQ0sOS1237&usqp=CAE'),
(54, 'Romero', '1800.00', 'Romero fresco orgánico x 50 gr', 'Hierbas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSpxAAekFmF7ASwpBzDowgDKth909kLkPnM-mPKcHXobLZDNvyor4vNfKjMUvb_tBhlWPre8ejN_xPteXMxMObKB4dsbUxf&usqp=CAE'),
(55, 'Manzanilla', '2300.00', 'Lleva a casa fácil y rápido Manzanilla Fresca Capuchon 50 gr.', 'Hierbas', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQMmlt7vPUnTPuoNDfABD-7qcxQq61y_66jcNUuJzQh8qhF2bGDnnpfBEcvUTk-GYm3654gyh9FGFtAFz0un3R5DKhLJjhctwANt8Hmd8DaeF0_HISAwbsP&usqp=CAE'),
(56, 'Tomillo', '2100.00', 'Tomillo x15gr\n', 'Hierbas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQQp0fYJl4bEKd2CkvheWb0XJf6FpJPub4PJ4VFz9ltqx4yav9YXzYFJKgVv5XUuwUJGUQZLT1VDM8O7xZqAsrBFjbqXcUssEbIT2GKRvHKwzBrUTaqtGiV&usqp=CAE'),
(57, 'Orégano', '1900.00', 'Orégano x60gr\n', 'Hierbas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRxr2yQbQ7CFdigCmmQOZRrQg6o6hEjjnZg9WqSEcTZJwQzHMsX6vkw4AYb6VlmEdwbCKEDKzcnrvYUudNqTU88PoFv_8G3walmk6U2gx5PkLICJklEyyqd&usqp=CAE'),
(58, 'Cilantro', '1500.00', 'Cilantro x 100g Cilantro x 100gr', 'Hierbas', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRs8BnzHWYtGV1XKy09UkOal37nLuoT6b7RncUkQ7AkfGnQc0Kxt4AGnJ3lw0XxTY4pO5W2acDZAmxQ-QCE3gYwutcpYr9mMfQdtDyo3Z33Cj9_qV0gBdp80g&usqp=CAE'),
(59, 'Perejil', '1400.00', 'Perejil crespo x60gr', 'Hierbas', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS4ed78ibA4-Uk6kduf7wFOr5d7yJTL23aaZln7wISS6-uN2bsdv0gZ2ufi8gNA_sgLp_7jj6YBfg2MAT03L7JG7O3nqnhBCVfc0qpPrh0euvnLcWIbLcxlRg&usqp=CAE'),
(60, 'Hierbabuena', '2400.00', 'Hierba buena bolsa 15 g\n', 'Hierbas', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQCKn0hYXdprakJnaGfjGFEAhPhdHCFBZL6goXP9qfY86BqquCrkDaDtaupkK6CWDQtePD111wixBCTWri7Op4O83vBqWuk0oKQGlG_2837uEQ_mUkn21U4Ww&usqp=CAE'),
(61, 'Ruda', '2700.00', 'RUDA ATADO *100 GRAMOS\n', 'Hierbas', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRFHZkBpoJvQ-n_jVghFoDydimIirkk0JBUpjZlwbLEH2f8goGf6VkwAip-TR8Qd06VsUpufXTCDEwDohZsm6aovkJfeSP2Xn9sIx9A5mKs7BAbVFeF0n6l9A&usqp=CAE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `email`, `password`, `nombres`, `direccion`, `rol`) VALUES
(1, 'admin@gmail.com', '1234', 'Administrador', 'Barrio', 'admin'),
(2, 'usuario1@gmail.com', '1234', 'Usuario Ejemplo', 'Barrio', 'cliente'),
(3, 'sample@example.com', '1234', 'Usuario1', 'Pasto', 'cliente'),
(4, 'alex@example.com', '1234', 'Alex', 'Fruver', 'cliente'),
(5, 'axla85@hotmail.com', '1234', 'Alexander Luna', 'Colombia', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `compras_ibfk_1` (`idUsuario`);

--
-- Indices de la tabla `productocarritos`
--
ALTER TABLE `productocarritos`
  ADD PRIMARY KEY (`idProductoCarrito`),
  ADD KEY `productocarritos_ibfk_1` (`idUsuario`),
  ADD KEY `productocarritos_ibfk_2` (`idProducto`);

--
-- Indices de la tabla `productocompras`
--
ALTER TABLE `productocompras`
  ADD PRIMARY KEY (`idProductoCompra`),
  ADD KEY `productocompras_ibfk_1` (`idCompra`),
  ADD KEY `productocompras_ibfk_2` (`idProducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productocarritos`
--
ALTER TABLE `productocarritos`
  MODIFY `idProductoCarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productocompras`
--
ALTER TABLE `productocompras`
  MODIFY `idProductoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productocarritos`
--
ALTER TABLE `productocarritos`
  ADD CONSTRAINT `productocarritos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productocarritos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productocompras`
--
ALTER TABLE `productocompras`
  ADD CONSTRAINT `productocompras_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compras` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productocompras_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
