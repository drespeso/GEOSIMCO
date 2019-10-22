function [ struct_folder ] = removepoints_v1( struct_folder,filess )

%   REMOVEPOINTS_v1 is part of GEOSIMCO_v1
%
%   Remove the virtual folders named by "." or ".." created by an assignation of the type ==> struct_folder=dir
%   INPUT:
%
%   struct_folder          ==> structure variable type containing the folder / subfolder information   
%   filess                 ==> number of subfolders contained in the directory
%     
%   INPUT
%
%   A struct_folder with . and .. virtual subfolders
%
%   OUTPUT
%   
%   A struct_folder containing only real subfolders where images are contained 
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


flag1=(strcmp({struct_folder.name}, '.')==1|strcmp({struct_folder.name}, '..')==1 );
struct_folder(flag1)=[];
if filess==0
    isdirectory=~cell2mat({struct_folder.isdir});
    struct_folder(isdirectory)=[];
end

end

