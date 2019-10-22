function [ vq ] = norm_surface_colony_v3(xmat_ellip,ymat_ellip,fmat_ellip,X_circle,Y_circle,chosen_radius,centerx,centery )
%   NORM_SURFACE_COLONY_v3 is part of GEOSIMCO_v1
%
%   The function first discard all the values out of the chosen radius that is considered colony,
%   then normalize the coordinates of every point and finally interpolate the values in the chosen reference grid    
%
%   INPUT:
%
%   xmat_ellip, ymat_ellip ==> X / Y coordinates of the selected pixels given in the image
%   fmat_ellip             ==> Intensity values of the selected pixels given in the image
%   X_circle, Y_circle     ==> X / Y positions of the reference grid
%   chosen_radius          ==> used radius to discard points out of the reference grid
%   centerx,centery        ==> X and Y positions of the image center
%       
%   OUTPUT
%   
%   Statistics for a reference grid with fixed spatial positions.
%   
%   
%   Run Example
%   ------------
%
%   The program automatically set the parameters, load the inital seed and run the simulation for the selected case.   
%
%
% The MIT License (MIT)
% 
% Copyright (c) 2019 David R. Espeso
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% 
%   $Version: 1.0 $  $Date: 2019/05/16 $
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% discard values larger than chosen_radius
chosen=(xmat_ellip-centerx).^2+(ymat_ellip-centery).^2>chosen_radius^2;
xmat_ellip(chosen)=[];
ymat_ellip(chosen)=[];
fmat_ellip(chosen)=[];

%%% normalize X and Y axis with major semiaxis
xmat_ellip=(xmat_ellip-centerx)/max(xmat_ellip-centerx);
ymat_ellip=(ymat_ellip-centery)/max(ymat_ellip-centery);

%%% Interpolate values in normalized query points [X_circle,Y_circle] from values pixel_int positioned in [pixel_posx,pixel_posy]    

vq = griddata(xmat_ellip,ymat_ellip,fmat_ellip,X_circle,Y_circle,'cubic');