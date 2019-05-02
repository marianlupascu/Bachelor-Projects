% Copyright (c) 2018 Bogdan Dumitrescu <bogdan.dumitrescu@acse.pub.ro>
% Copyright (c) 2016 Paul Irofti <paul@irofti.net>
% 
% Permission to use, copy, modify, and/or distribute this software for any
% purpose with or without fee is hereby granted, provided that the above
% copyright notice and this permission notice appear in all copies.
% 
% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

function [D,X,shared] = aksvd_mask(Y,D,X,~,Ymask)
%% Approximate K-SVD algorithm
% INPUTS:
%   Y     -- training signals set
%   Ymask -- varargin{1} = signal mask
%   D     -- current dictionary
%   X     -- sparse representations
%
% OUTPUTS:
%   D -- updated dictionary
%   X -- updated representations
    replatoms = 'random';
    [D,X] = atom_up_mask(Y,Ymask,D,X,replatoms,@(Y,D,X,x,Ymask) aksvd_mask_up(Y,D,X,x,Ymask));
end

function [d,x] = aksvd_mask_up(Y,D,X,x,Ymask)
%% Approximate K-SVD atom update
% INPUTS:
%   Y -- training signals set
%   D -- current dictionary
%   X -- sparse representations
%   x -- sparse representations row using the current atom
%
% OUTPUTS:
%   d -- updated atom
%   x -- updated representations corresponding to the current atom
%     d = Y *x' - D*(X*x');
%     d = d/norm(d);
%     x = Y'*d - (D*X)'*d;
    d = Ymask.*(Y - D*X)*x';
    d = d/norm(d);
    x = (Ymask.*(Y - D*X))'*d;
    for j = 1 : length(x)
      x(j) = x(j) / ((Ymask(:,j).*d)'*(Ymask(:,j).*d));
    end
end
