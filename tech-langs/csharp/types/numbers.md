��#   N u m e r i c   T y p e s  
  
 h t t p s : / / d o c s . m i c r o s o f t . c o m / e n - u s / d o t n e t / c s h a r p / l a n g u a g e - r e f e r e n c e / k e y w o r d s / i n t e g r a l - t y p e s - t a b l e  
  
  
 -   I n t e g r a l s   ( i n t e g e r s )  
     -   U n s i g n e d  
     -   S i g n e d  
 -   F l o a t i n g   p o i n t s  
     -   S i n g l e   p r e c i s i o n   ( b a s e   2 )  
     -   D o u b l e   p r e c i s i o n   ( b a s e   2 )  
     -   Q u a d r u p l e   p r e c i s i o n   ( b a s e   1 0 )  
  
  
 # #   D e b r i e f :   N u m b e r s  
 -   ` i n t `   a n d   ` l o n g `   a r e   f i r s t - c l a s s   t y p e s   f a v o r e d   b y   C P U   a n d   C # ' s   R u n t i m e  
 -   ` f l o a t `   a n d   ` d o u b l e `   a l s o   h a v e   g o o d   s u p p o r t   ( C P U   a n d   r e g i s t e r s )  
 -   ` d e c i m a l `   i s   a b o u t   1 0 x   s l o w e r   t h e n   ` f l o a t `  
 -   ` d e c i m a l `   i s   a l s o   a   f l o a t i n g   t y p e ,   b u t   w i t h   b a s e   1 0   e x p o n e n t .  
 -   s u f f i x e s   a r e   c a s e   i n s e n s i t i v e .  
 -   I n t e g r a l s   c a n   a l s o   b e   a s s i g n e d   u s i n g   h e x   n o t a t i o n   w i t h   ` 0 x `   p r e f i x .  
 -   B i n a r y   n o t a t i o n   w i t h   ` 0 b `   p r e f i x   ( s i n c e   C #   7 )  
 -   D i g i t s   o f   p r e c i s i o n :   7   f l o a t ,   1 5 - 1 6   d o u b l e ,   2 8 - 2 9   d e c i m a l .  
  
 >   U s e   ` S y s t e m . N u m e r i c s . B i g I n t e g e r `   c l a s s   t o   r e p r e s e n t   a n   a r b i t r a r i l y   l a r g e   s i g n e d   i n t e g e r .  
  
  
  
 # #   N u m e r i c   t y p e s  
  
 |   C s   T y p e   |   S y s t e m .   |   S u f   |   S i z e   |   R a n g e                                 |   P r e c i s i o n   |  
 | - - - - - - - - - | - - - - - - - - : | - - - - - | - - - - - : | - - - - - - - - - - - - - - - - - - - - - - | - - - - - - - - - - - |  
 |   s b y t e       |       S B y t e   |           |         8   |   - 2 ^ 7     t o     2 ^ 7  1             |                       |  
 |   s h o r t       |       I n t 1 6   |           |       1 6   |    2 ^ 1 5   t o   2 ^ 1 5  1             |                       |  
 |   i n t           |       I n t 3 2   |           |       3 2   |    2 ^ 3 1   t o   2 ^ 3 1  1             |                       |  
 |   l o n g         |       I n t 6 4   |   L       |       6 4   |    2 ^ 6 3   t o   2 ^ 6 3  1             |                       |  
 |   b y t e         |         B y t e   |           |         8   |   0   t o   2 ^ 8  1                       |                       |  
 |   u s h o r t     |     U I n t 1 6   |           |       1 6   |   0   t o   2 ^ 1 6  1                     |                       |  
 |   u i n t         |     U I n t 3 2   |   U       |       3 2   |   0   t o   2 ^ 3 2  1                     |                       |  
 |   u l o n g       |     U I n t 6 4   |   U L     |       6 4   |   0   t o   2 ^ 6 4  1                     |                       |  
 |   f l o a t       |     S i n g l e   |   F       |       3 2   |   �     ~ 1 0 ^  4 5   t o   1 0 ^ 3 8     |   7                   |  
 |   d o u b l e     |     D o u b l e   |   D       |       6 4   |   �   ~ 1 0 ^  3 2 4   t o   1 0 ^ 3 0 8   |   1 5 - 1 6           |  
 |   d e c i m a l   |   D e c i m a l   |   M       |     1 2 8   |   �     ~ 1 0 ^  2 8   t o   1 0 ^ 2 8     |   2 8 - 2 9           |  
  
 e . g .   ` S y s t e m . I n t 3 2   = =   i n t `  
  
  
  
 # #   I n t e g r a l s   t y p e s  
  
 |   C s   T y p e   |   F r a m e w o r k           |   S u f   |   S i z e   |             R a n g e             |  
 | - - - - - - - - - | - - - - - - - - - - - - - - - | - - - - - | - - - - - : | : - - - - - - - - - - - - - - - : |  
 |   b y t e         |   S y s t e m . B y t e       |           |         8   |       0   t o   2 ^ 8  1         |  
 |   s b y t e       |   S y s t e m . S B y t e     |           |         8   |     - 2 ^ 7   t o   2 ^ 7  1     |  
 |   u s h o r t     |   S y s t e m . U I n t 1 6   |           |       1 6   |       0   t o   2 ^ 1 6  1       |  
 |   s h o r t       |   S y s t e m . I n t 1 6     |           |       1 6   |    2 ^ 1 5   t o   2 ^ 1 5  1   |  
 |   u i n t         |   S y s t e m . U I n t 3 2   |   U       |       3 2   |       0   t o   2 ^ 3 2  1       |  
 |   i n t           |   S y s t e m . I n t 3 2     |           |       3 2   |    2 ^ 3 1   t o   2 ^ 3 1  1   |  
 |   u l o n g       |   S y s t e m . U I n t 6 4   |   U L     |       6 4   |       0   t o   2 ^ 6 4  1       |  
 |   l o n g         |   S y s t e m . I n t 6 4     |   L       |       6 4   |    2 ^ 6 3   t o   2 ^ 6 3  1   |  
  
  
 T h e r e   a r e   4   s i g n e d   i n t e g e r   t y p e s   t h a t   c a n   b e   u s e d   d e p e n d i n g   o n   h o w   l a r g e   a   n u m b e r   y o u   n e e d   t h e   v a r i a b l e   t o   h o l d .  
  
 I n t e g e r s   c a n   a l s o   b e   a s s i g n e d   u s i n g   h e x a d e c i m a l   n o t a t i o n ,   ` 0 x `   p r e f i x  
 A s   o f   C #   7 . 0 ,   t h e r e   i s   a   b i n a r y   n o t a t i o n   a s   w e l l ,   p r e f i x e d   w i t h   ` 0 b ` .  
  
 V e r s i o n   7 . 0   o f   C #   a l s o   a d d e d   a   d i g i t   s e p a r a t o r   ( _ )   t o   i m p r o v e   r e a d a b i l i t y   o f   l o n g   n u m b e r s .   T h i s   d i g i t   s e p a r a t o r   c a n   a p p e a r   a n y w h e r e   w i t h i n   t h e   n u m b e r ,   a s   w e l l   a s   a t   t h e   b e g i n n i n g   o f   t h e   n u m b e r   a s   o f   C #   7 . 2 .  
  
  
 # #   F l o a t i n g - P o i n t   T y p e s  
  
 T h e   f l o a t i n g - p o i n t   t y p e s   c a n   s t o r e   r e a l   n u m b e r s   w i t h   d i f f e r e n t   l e v e l s   o f   p r e c i s i o n .   L i t e r a l   ( c o n s t a n t )   f l o a t i n g - p o i n t   n u m b e r s   a r e   a l w a y s   k e p t   a s   d o u b l e s ,   s o   i n   o r d e r   t o   a s s i g n   s u c h   a   n u m b e r   t o   a   f l o a t   v a r i a b l e ,   a n   F   c h a r a c t e r   n e e d s   t o   b e   a p p e n d e d   t o   c o n v e r t   t h e   n u m b e r   t o   t h e   f l o a t   t y p e .   T h e   s a m e   a p p l i e s   t o   t h e   M   c h a r a c t e r   f o r   d e c i m a l s .  
  
 T h e   p r e c i s i o n s   o f   f l o a t i n g - p o i n t   t y p e s   r e f e r s   t o   t h e   t o t a l   n u m b e r   o f   d i g i t s   t h a t   t h e   t y p e s   c a n   h o l d .  
  
 F o r   e x a m p l e ,   w h e n   a t t e m p t i n g   t o   a s s i g n   m o r e   t h a n   7   d i g i t s   t o   a   f l o a t ,   t h e   l e a s t   s i g n i f i c a n t   o n e s   w i l l   g e t   r o u n d e d   o f f .  
  
 ` ` ` c s  
 m y F l o a t   =   1 2 3 4 5 . 6 7 8 9 F ;   / /   r o u n d e d   t o   1 2 3 4 5 . 6 8  
 F l o a t i n g - p o i n t   n u m b e r s   c a n   b e   a s s i g n e d   u s i n g   e i t h e r   d e c i m a l   o r  
 e x p o n e n t i a l   n o t a t i o n ,   a s   i n   t h e   f o l l o w i n g   e x a m p l e .  
 m y D o u b l e   =   3 e 2 ;   / /   3 * 1 0 ^ 2   =   3 0 0  
 ` ` `  
  
  
 # #   N u m e r i c   L i t e r a l s  
  
 I n t e g r a l   l i t e r a l s   c a n   a l s o   u s e   h e x a d e c i m a l   n o t a t i o n :  
 ` l o n g   y   =   0 x 7 F `  
  
 F r o m   C # 7 ,   u n d e r s c o r e   i s   a l l o w e d   a s   ( i g n o r e d )   s e p a r a t o r :  
 ` i n t   m i l   =   1 _ 0 0 0 _ 0 0 0 `  
  
 F r o m   C # 7 ,   b i n a r y   n o t a t i o n :  
 ` v a r   b   =   0 b 1 0 1 0 _ 1 0 1 1 `  
  
 R e a l   l i t e r a l s   c a n   a l s o   u s e   e x p o n e n t i a l   n o t a t i o n :  
 ` d o u b l e   m i l   =   1 E 0 6 `  
  
  
 # #   N u m e r i c   i n f e r e n c e  
  
 T h e   c o m p i l e r   i n f e r s   a   n u m e r i c   l i t e r a l   t o   b e   a   d o u b l e   o r   a n   i n t e g r a l :  
 -   ` d o u b l e ` :   i f   i t   c o n t a i n s   a   d e c i m a l   p o i n t   o r   t h e   e x p o n e n t i a l   s y m b o l   ( E )  
 -   o t h e r w i s e ,   t h e   t y p e   i s   t h e   f i r s t   t y p e   i n   t h i s   l i s t ,   t h a t   c a n   f i t   t h e  
     l i t e r a l ' s   v a l u e , :   ` i n t ` ,   ` u i n t ` ,   ` l o n g ` ,   ` u l o n g ` .  
  
 # #   N u m e r i c   s u f f i x e s  
  
 -   s u f f i x e s   a r e   c a s e   i n s e n s i t i v e  
 -   s u f f i x e s   ` U `   a n d   ` L `   a r e   r a r e l y   n e c e s s a r y ,   b e c a u s e   t h e   u i n t ,   l o n g   a n d   u l o n g  
     c a n   n e a r l y   a l w a y s   b e   e i t h e r   i n f e r r e d   o r   i m p l i c i t l y   c o n v e r t e d   f r o m   i n t :  
     l o n g   i   =   5   ( i m p l i c i t   l o s s l e s s   c o n v e r s i o n )  
 -   ` D `   s u f f i x   i s   t e c h n i c a l l y   r e d u n d a n t ,   i n   t h a t   a l l   l i t e r a l s   w i t h   a   d e c i m a l  
     p o i n t   a r e   i n f e r r e d   t o   b e   d o u b l e .  
 -   ` F `   a n d   ` M `   s u f f i x e s   s h o u l d   a l w a y s   b e   a p p l i e d   w h e n   s p e c i f y i n g   a   f l o a t   o r  
     a   d e c i m a l .   W i t h o u t   t h e   F   s u f f i x ,   t h i s   w o u l d   n o t   c o m p i l e ,   b e c a u s e   4 . 5   w o u l d  
     b e   i n f e r r e d   a s   d o u b l e ,   w h i c h   h a s   n o   i m p l i c i t   c o n v e r s i o n   t o   f l o a t :  
             f l o a t   f   =   4 . 5 F ;  
     T h e   s a m e   p r i n c i p l e   i s   t r u e   f o r   a   d e c i m a l   l i t e r a l :  
             d e c i m a l   d   =   - 1 . 2 3 M ;   / /   W i l l   n o t   c o m p i l e   w i t h o u t   t h e   M   s u f f i x .  
  
  
 # #   N u m e r i c   C o n v e r s i o n s  
  
 C o n v e r s i o n s   a r e   i m p l i c i t   i f   t h e   d e s t i n a t i o n   t y p e   c a n   r e p r e s e n t   e v e r y   p o s s i b l e   v a l u e   o f   t h e   s o u r c e   t y p e .   O t h e r w i s e ,   a n   e x p l i c i t   c o n v e r s i o n   i s   r e q u i r e d .  
  
 * * b e t w e e n   i n t e g r a l s * *  
 -   i m p l i c i t :   s m a l l e r   t o   b i g g e r  
 -   e x p l i c i t :   b i g g e r   t o   s m a l l e r  
  
         i n t   x   =   1 2 3 4 5 ;             / /   3 2 - b i t   i n t e g e r  
         l o n g   y   =   x ;                   / /   I m p l i c i t   c o n v e r s i o n   t o   6 4 - b i t   i n t e g e r  
         s h o r t   z   =   ( s h o r t ) x ;   / /   E x p l i c i t   c o n v e r s i o n   t o   1 6 - b i t   i n t e g e r  
  
 * * b e t w e e n   f l o a t s * *  
 -   i m p l i c i t :   ` f l o a t `   t o   ` d o u b l e `  
 -   e x p l i c i t :   ` d o u b l e `   t o   ` f l o a t `  
  
 * * b e t w e e n   f l o a t i n g - p o i n t s   a n d   i n t e g r a l s * *  
 -   i m p l i c i t :   a l l   i n t e g r a l   t y p e s   t o   a l l   f l o a t i n g - p o i n t   t y p e s  
         i n t   i   =   1 ;  
         f l o a t   f   =   i ;  
 -   e x p l i c i t :   a l l   f l o a t i n g - p o i n t   t y p e s   t o   a l l   i n t e g r a l   t y p e s  
         i n t   i 2   =   ( i n t ) f ;  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 