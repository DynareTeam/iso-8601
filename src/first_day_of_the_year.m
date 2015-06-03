function d = first_day_of_the_year(y)

% Returns the first day (1, 2, 3, 4, 5, 6 or 7) of year
% y. Implementation of Gauss algorithm.
%
% INPUTS 
% - y [integer] the year.
%
% OUTPUS 
% - d [integer] the day of the week (1, 2, ..., 7).

% Copyright (C) 2015 Dynare Team
%
% The iso8601 package is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare iso8601 submodule is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

d = mod(1+5*mod(y-1,4)+4*mod(y-1,100)+6*mod(y-1,400), 7);

% Monday is the first day of the week acoording to ISO-8607
idx = (d==0);
d(idx) = 7;

%@test:1
%$ 
%$ t = zeros(7,1);
%$
%$ try
%$     d = first_day_of_the_year(2000);
%$     t(1) = 1;
%$ catch
%$     t(1) = 0;
%$ end
%$
%$ if t(1)
%$     t(2) = dassert(d, 6);
%$     t(3) = dassert(first_day_of_the_year(1971), 5);
%$     t(4) = dassert(first_day_of_the_year(1966), 6);
%$     t(5) = dassert(first_day_of_the_year(2009), 4);
%$     t(6) = dassert(first_day_of_the_year(1938), 6);
%$     t(7) = dassert(first_day_of_the_year(1935), 2);
%$ end
%$
%$ T = all(t);
%@eof:1