classdef Connections
    %CONNECTIONS This class keeps track of all the connections
    %   A separate class for connections is used to provide a view from the
    %   connection level.
    
    properties
        m1 %first member of a connection edge
        m2 %second member of a connection edge
    end
    
    methods
        function obj = Connections(a,b)
            %Default, parameterised constructon for the class
            obj.m1 = a;
            obj.m2 = b;
        end
    end
    
end

