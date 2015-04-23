function varargout = vecsurf(varargin)

%Vector To 3D Surface Function -
%----------------------------------------------------------------------------------------------------------------------
%General Description:
%This function purpose is to aid a programmer in the plotting of 3D vector
%data in a 3D surface form. It transform the vector data in to it 3D surface 
%plot Form. Additionally, The function offer its hand in cases where 
%the vectors data is not sufficient for the creation of a qualitative 3D surface. 
%----------------------------------------------------------------------------------------------------------------------
%Directions of Use:
%For first base the programmer will provide three vectors of data for each
%of the three dimensions respectively to the order they are wirtten. The 
%other bases are options which are destined for the creation of a 
%qualitative 3D surface and some additionally ease of use options. 
%Each option can be activated by inputing an option code through  
%a string vector. The use of this options determines if there will be a 
%reutrn matrices. Moreover, some options request specification data. 
%This data is inputed by a specification matrix that is deliverd to the 
%function beside it correspond option code.
%----------------------------------------------------------------------------------------------------------------------
%Inputed Data Specification:
%
%Three Vectors For Three Dimensions- 
%The programmer will provide three vectors for each of the three 
%dimensions. This vectors will be written in a row fashion, in other 
%words each pattern of the vector will be in a different row. Each vector 
%will have the exact same rows as the other tow vectors hence that for a 
%3D surface plot each third dimension pattern require to have three parts 
%of vector data respectively for each of the three dimensions. 
%
%Mosaic Picture Option -  Option Code 'MosaicPicture':
%Vector data is generally defected by insufficient data. This deficiency 
%could cause the three dimensional picture to be distorted, incolmplete 
%and will be swarming by gaps. This unfortunate case comes in to being
%in the creation of the three dimensional matrices. As the creation process
%progresses new data points which are not included in the vector data 
%might be created. In this condition this new data points creates the above
%written problom. The Mosaic Picture option offer a hand in this 
%situation. In the using of the option it will complete the incompleteness 
%of the three dimensional picture. This procces focuses on the connecting
%of the present data points in the vector data, thus the end resault is an 
%assumption and not a 100% bulletproof algoritem. In addition, the 
%effectiveness of the assumption algoritem is affected by the ratio 
%betwean the precentage of actual data to the precentage of imaginary
%data(new data created by the function and not inputed by the 
%programmer). The greater this ratio is the lesser the effectivness of the 
%assumption algoritem can get. If the option is at off mode, All the
%new points that will be created will get a zero value.
%
%Mosaic Grid Points Option - Option Code 'OneGridPoints' + 'SecGridPoints':
%This option has a one dimension type and a second dimension type. 
%Option code 'OneGridPoints' for one diemnsion and option code 
%'SecGridPoints' for second dimension. This option request a 
%specification matrix. This specification matrix will be of a scalar form.
%Vector data in some cases is unsuitable for the creation of a 3D surface.
%Insufficient data in the first or second vector dimensions is to blame. 
%Moreover, the insufficient data might be a problom for a programmer
%who is interested in a much qualitative 3D surface than the one his 
%vector data can deliver. In this cases the Mosaic Grid Points option offer 
%its hand.  Every natural value greater or equal to tow will be enterd in the
%specification matrix. Each value represent the minimum number of grid
%points the 3D surface will have for each of the first and second 
%dimensions respectively to the option code in use. In other words, the 
%programmer can set a minimum boundry for the length and  width of the 
%3D surface.
%
%Mosiac Grid Points Boundry Option - Option Code 'OneBoun' + 'SecBoun':
%This option has a one dimension type and a second dimention type. 
%Option code 'OneBoun' for one diemnsion and option code 'SecBoun' 
%for second dimension. This option request a specification matrix. The 
%specification matrix will be a one row vector of tow columns. In the using
%of Mosaic Grid Points option a problom may rise. Without a grid points 
%value boundry the qualitative of the 3D surface may be deficient. For 
%this case this option was born. In the specification matrix the programmer
%will specify the value boundry, the first column will get the minimum 
%value whereas the second column will get the maximum value.
%
%Repeated One and Second Dimension Pattern Warning Option - 
%Option Code 'Warning':
%When the vector data is transforming into three dimensional surface data the 
%first and second dimensions vectors acts like a tow dimensional grid. In light 
%of this, for every grid point pattern there is one representation of the 
%third dimension vector in the three dimensional surface data. So, if the vector 
%data holds a number of the same first and second dimension patterns, 
%there respective third dimension pattern will overwrite each other. 
%Therefore, The Warning option offer a hand that will inform the 
%programmer if such case occurred.
%
%Specification Findings of Repeated One and Second Dimension Pattern 
%Warning Option - Option Code 'WarningSpecs':
%If the programmer wish to investegate the findings of the Repeated One
%and Second Dimension Pattern Warning Option he can ask for this option.
%
%Progress Bar - Option Code 'Progress':
%This option is destined for a programmer who is intersted in seeing the 
%function progress. 
%
%Plotting the Three Dimensional Surface - Option Code 'Plot':
%This option request a specification matrix. The specification matrix  is 
%of a scalar form. For ease of use the function provide the programmer 
%with an option that plots the 3D surface in the programmer behalf. 
%For plotting with the surf function a 1 value is requested in the 
%specification matrix, for mesh function a 2 value is requested in the 
%specification matrix.
%
%Representational Three Dimensional Surface - Option Code 'Representation':
%This option request a specification matrix. The specification matrix will 
%be a one row vector of tow columns. Three dimensional surface is often 
%characterized by the amount of detail it holds. Large amounts of detail 
%means large quantities of data which in turn means big calculations. 
%Thus, this can be a burden for slower computers. Therefore, the function
%offer this option to aid in this situation. By creating out of the programmer 
%dimension vectors a representational three dimensional surface the 
%function can control the amount of detail and so control the quantity 
%of the calculations. In order for the programmer to control the amount 
%of detail an explanation have to be made. The functions sees the first 
%and second dimension vectors as a tow dimensional grid, so the amount
%of detail is regulated by adjusting the number of grid points for each 
%dimension. To control the number of grid points for dimension one a 
%natural value greater or equal to tow is requierd in cell (1,1) of the 
%specification matrix and to control the number of grid points for 
%dimension tow a natural value greater or equal to tow is requested in 
%cell (1,2) of the specification matrix. Note that when this option is
%activated Mosaic Picture option will be activated as well, in addition,
%Mosaic Grid Points option will not have an effect on the result surface.
%
%Smooth Three Dimensional Surface - Option Code 'Smooth':
%This option requires a specification matrix. The specification matrix
%will be a one row vector of three columns. This option is an expansion
%to the Representationl Three Dimensional Surface option. The result of this
%option is the smoothness of the surface. In the use of this option the 
%programmer is required to give three smoothness parameters. Cell (1,1) is
%a parameter which defines the smoothness in the second dimension, Cell
%(1,2) is a parameter which defines the smoothness in the first dimension.
%Both of this parameters requiers a natural value greater from one. The
%higher the value the higher the smoothness. Cell(1,3) defines the amount
%of smooth actions. It requires a natural value greater from zero. The
%higer the value the more smooth actions that will take place.
%
%Representational Three Dimensional Surface Grid Value Boundry - Option
%Code 'RepOneBoun' + 'RepSecBoun':
%This option requires a specification matrix. The specification matrix will
%be a one row vector of tow columns. This option is an expansion to the
%Representational Three Dimensional Surface option. It has a one dimension type
%and a second dimension type. 'RepOneBoun' for dimension one and 'RepSecBoun' for 
%dimension tow. With the understanding that the one and second dimensions vectors create
%a grid which the third dimension data is laid upon the programmer can choose the
%boundry of that grid for the Representational Three Dimensional Surface. Cell (1,1) 
%of the specification matrix is the minimum value boundry and cell (1,2) of the 
%specification matrix is the maximum value boundry.
%
%Importent:
%In the creation of the 3D surface the function relate to the one and second 
%dimension vectors as a tow dimensional grid which the third dimension
%is laid apon. Furthermore, This algoritem creates a known problom in 
%which new data points which was not included in the vector data might 
%be created. With option code 'MosaicPicture' deactivated this new data points will get a
%zero value.
%----------------------------------------------------------------------------------------------------------------------
%Return Value:
%Return values will be returned to the programmer in the case where 
%option code 'Plot' is not activated. The function will return three matrices 
%which have with in them 3D surface plot data for each of the vector 
%dimensions respectively to the order the vector dimensions were sent to 
%the function. It is allways importent to consider the structure of the three 
%dimensional data. The first and second dimensions acts like a tow 
%dimensional grid which the third dimension is laid apon. In this way, 
%the order that the 3D surface plot data matrices are sent to the plot 
%functions is crucial . So, the first and second dimension should be the 
%first and second matrices which will be sent to the plot functions. In spite
%of the former, The order of the first and second dimension betwean 
%themselves is unimportant.
%----------------------------------------------------------------------------------------------------------------------
%Function Technical Instructions:
%The function will be written as follows:
%[Dimension One 3D Surface Data,Dimension Tow 3D Surface Data,
%Dimension Three 3D Surface Data] = vecsurf(Dimension One 
%Vector,Dimension Tow Vector,Dimension Three Vector,Option Code,
%Specification Matrix If Demanded,Option Code,Specification Matrix 
%If Demanded,...);
%----------------------------------------------------------------------------------------------------------------------
%One Last Thing Before You Go:
%It's importent to keep in mind the fact that as more options are used the 
%greater the calculation the function has to conduct.
%
%Good Luck!!!!!!!!!!!!!

%Progress Bar Graphical User Interface Initialization Code Interrupt ->

%Error Catch ->

try 
  
        %Error Catch <-
    
        mat0 = [  0         0    0.5625;  0         0    0.6250; 0         0    0.6875;   0         0    0.7500;  0         0    0.8125; 0         0    0.8750; ...
                       0         0    0.9375;  0         0    1.0000;0    0.0625    1.0000; 0    0.1250    1.0000; 0    0.1875    1.0000; ...
                       0    0.2500    1.0000;     0    0.3125    1.0000;    0    0.3750    1.0000;0    0.4375    1.0000; 0    0.5000    1.0000; ...
                       0    0.5625    1.0000; 0    0.6250    1.0000;0    0.6875    1.0000; 0    0.7500    1.0000; 0    0.8125    1.0000; ...
                       0    0.8750    1.0000; 0    0.9375    1.0000;   0    1.0000    1.0000;0.0625    1.0000    1.0000;0.1250    1.0000    0.9375; ...
                       0.1875    1.0000    0.8750;0.2500    1.0000    0.8125; 0.3125    1.0000    0.7500;0.3750    1.0000    0.6875; ...
                       0.4375    1.0000    0.6250; 0.5000    1.0000    0.5625;0.5625    1.0000    0.5000;0.6250    1.0000    0.4375; ...
                       0.6875    1.0000    0.3750;  0.7500    1.0000    0.3125;0.8125    1.0000    0.2500;0.8750    1.0000    0.1875; ...
                       0.9375    1.0000    0.1250;1.0000    1.0000    0.0625;1.0000    1.0000         0;1.0000    0.9375         0; ...
                       1.0000    0.8750         0; 1.0000    0.8125         0;1.0000    0.7500         0;   1.0000    0.6875         0; 1.0000    0.6250         0; ...
                       1.0000    0.5625         0; 1.0000    0.5000         0; 1.0000    0.4375         0; 1.0000    0.3750         0;1.0000    0.3125         0; ...
                       1.0000    0.2500         0;  1.0000    0.1875         0;1.0000    0.1250         0;1.0000    0.0625         0; 1.0000         0         0; ...
                        0.9375         0         0;  0.8750         0         0;0.8125         0         0; 0.7500         0         0; 0.6875         0         0;  ...
                        0.6250         0         0;    0.5625         0         0];


         mat1 = [ 0         0    1.0000;    0    0.5000         0;1.0000         0         0;     0    0.7500    0.7500; 0.7500         0    0.7500;  ...
                        0.7500    0.7500         0;    0.2500    0.2500    0.2500];

        try             
            handles.prowin = figure('Color',[0.250980392156863 0 0.501960784313725], ...
                'Colormap',mat0, ...
                'FileName','C:\MATLAB_SE_5.3\work\progressbar_example.m', ...
                'MenuBar','none', ...
                'Name','Vector To 3D Surf Progress Bar', ...
                'PaperPosition',[18 180 576 432], ...
                'PaperUnits','points', ...
                'Position',[415 319 562 102], ...
                'Tag','Fig1', ...
                'ToolBar','none','visible','off');
            handles.progbar = axes('Parent',handles.prowin, ...
                'Units','pixels', ...
                'AmbientLightColor',[0.219607843137255 0.780392156862745 0.470588235294118], ...
                'CameraUpVector',[0 1 0], ...
                'Color',[1 1 1], ...
                'ColorOrder',mat1, ...
                'Position',[15 23 488 29], ...
                'Tag','pbar', ...
                'XColor',[0 0 0], ...
                'YColor',[0 0 0], ...
                'ZColor',[0 0 0]);
            h2 = text('Parent',handles.progbar, ...
                'Color',[0 0 0], ...
                'HandleVisibility','off', ...
                'HorizontalAlignment','center', ...
                'Position',[0.4989733059548254 -0.8571428571428572 9.160254037844386], ...
                'Tag','Axes1Text4', ...
                'VerticalAlignment','cap');
            set(get(h2,'Parent'),'XLabel',h2);
            h2 = text('Parent',handles.progbar, ...
                'Color',[0 0 0], ...
                'HandleVisibility','off', ...
                'HorizontalAlignment','center', ...
                'Position',[-0.05954825462012321 0.464285714285714 9.160254037844386], ...
                'Rotation',90, ...
                'Tag','Axes1Text3', ...
                'VerticalAlignment','baseline');
            set(get(h2,'Parent'),'YLabel',h2);
            h2 = text('Parent',handles.progbar, ...
                'Color',[0 0 0], ...
                'HandleVisibility','off', ...
                'HorizontalAlignment','right', ...
                'Position',[-0.03080082135523614 2.785714285714286 9.160254037844386], ...
                'Tag','Axes1Text2');
            set(get(h2,'Parent'),'ZLabel',h2);
            h2 = text('Parent',handles.progbar, ...
                'Color',[0 0 0], ...
                'HandleVisibility','off', ...
                'HorizontalAlignment','center', ...
                'Position',[0.4989733059548254 1.25 9.160254037844386], ...
                'Tag','Axes1Text1', ...
                'VerticalAlignment','bottom');
            set(get(h2,'Parent'),'Title',h2);
            handles.protex = uicontrol('Parent',handles.prowin, ...
                'Units','points', ...
                'BackgroundColor',[1 0 0.501960784313725], ...
                'FontSize',13, ...
                'ForegroundColor',[0 1 0], ...
                'ListboxTop',0, ...
                'Position',[381.75 17.25 32.25 21], ...
                'Style','text', ...
                'Tag','ptext');
            h1 = uicontrol('Parent',handles.prowin, ...
                'Units','points', ...
                'BackgroundColor',[0 0 1], ...
                'Callback','Title', ...
                'FontSize',20, ...
                'ForegroundColor',[0 1 0], ...
                'ListboxTop',0, ...
                'Position',[36.75 44.25 324.75 27], ...
                'String','Vector To 3D Surf Progress Bar:', ...
                'Style','text', ...
                'Tag','Title');
            handles.comtex = uicontrol('Parent',handles.prowin, ...
                'Units','points', ...
                'BackgroundColor',[0.250980392156863 0 0.501960784313725], ...
                'FontSize',20, ...
                'ForegroundColor',[0 1 1], ...
                'ListboxTop',0, ...
                'Position',[51 10.5 300.75 22.5], ...
                'String','Calculation Completed', ...
                'Style','text', ...
               'Tag','cifal_com', ...
                'Visible','off');
            if nargout > 0, fig = handles.prowin; end
        end
        
        %Progress Bar Graphical User Interface Initialization Code Interrupt <-

        %Debbuging ->

        %Debbuging for Variables and for Input & Output Parameters ->

        varg_cellmax = size(varargin,2);

        if(varg_cellmax < 3)
           error('MyError:ErrorPrevent','vecsurf Error - Input Data: A minmum of three vectors is required.');
        end

        if(hasInfNaN(varargin{1,1}))    
            varargin{1,2}(isnan(varargin{1,1})) = [];
            varargin{1,2}(isinf(varargin{1,1})) = [];
            varargin{1,3}(isnan(varargin{1,1})) = [];
            varargin{1,3}(isinf(varargin{1,1})) = [];
            varargin{1,1}(isnan(varargin{1,1})) = [];
            varargin{1,1}(isinf(varargin{1,1})) = [];
            disp(sprintf(['vecsurf Warning - NaNs and/or Infs were identified in the vector\n' ...
                              'of the first dimension. Be advised that the data pattern that they were\n' ...
                              'belong to was removed from the vector data.']));
        end                                            

        if(hasInfNaN(varargin{1,2}))  
            varargin{1,1}(isnan(varargin{1,2})) = [];
            varargin{1,1}(isinf(varargin{1,2})) = [];
            varargin{1,3}(isnan(varargin{1,2})) = [];
            varargin{1,3}(isinf(varargin{1,2})) = [];
            varargin{1,2}(isnan(varargin{1,2})) = [];
            varargin{1,2}(isinf(varargin{1,2})) = [];
            disp(sprintf(['vecsurf Warning - NaNs and/or Infs were identified in the vector\n' ...
                              'of the second dimension. Be advised that the data pattern that they were\n' ...
                              'belong to was removed from the vector data.']));
        end  

        if(hasInfNaN(varargin{1,3})) 
            varargin{1,1}(isnan(varargin{1,3})) = [];
            varargin{1,1}(isinf(varargin{1,3})) = [];
            varargin{1,2}(isnan(varargin{1,3})) = [];
            varargin{1,2}(isinf(varargin{1,3})) = [];
            varargin{1,3}(isnan(varargin{1,3})) = [];
            varargin{1,3}(isinf(varargin{1,3})) = [];
            disp(sprintf(['vecsurf Warning - NaNs and/or Infs were identified in the vector\n' ...
                              'of the third dimension. Be advised that the data pattern that they were\n' ...
                              'belong to was removed from the vector data.']));
        end  

        [onedim_rowmax,onedim_colmax] = size(varargin{1,1});
        [seconddim_rowmax,seconddim_colmax] = size(varargin{1,2});
        [thirddim_rowmax,thirddim_colmax] = size(varargin{1,3});

        if([onedim_colmax ~= 1] | [seconddim_colmax ~= 1] | [thirddim_colmax ~= 1])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Vector Data: The three dimensions are vectors in a row\n' ...
                          'expanding fashion, in light of this a one column matrix is required.']));
        end

        if([onedim_rowmax ~= seconddim_rowmax] | [seconddim_rowmax ~= thirddim_rowmax])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Vector Data: Every row in all the dimension vectors represent\n' ...
                            'a pattern. With the concept that every third dimension pattern consist of three dimension\n' ...
                            'points of data, an exact number of rows for each dimension vector is required.']));
        end

        if([onedim_rowmax < 1] | [seconddim_rowmax < 1] | [thirddim_rowmax < 1])
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Vector Data: The vector data must consist of at\n' ...
                           'least one pattern.']));
        end

        code_checklist(1:13,1:2) = 0;
        followvarg_cell = 4;
        spec_flag = 0;

        while(followvarg_cell <= varg_cellmax)

           if(spec_flag == 0)
              [inputmat_rowmax,inputmat_colmax] = size(varargin{1,followvarg_cell});

              if(inputmat_rowmax ~= 1)
                 error('MyError:ErrorPrevent','vecsurf Error - Option Code: Must be a string vector');
              end

              error_flag(1,1:2) = 0;

              if(strcmp('MosaicPicture',varargin{1,followvarg_cell}) == 1)

                  if(code_checklist(1,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(1,1) = 1;
                  end
              elseif(strcmp('OneGridPoints',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 2;

                  if(code_checklist(2,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(2,1) = 1;
                  end
              elseif(strcmp('OneBoun',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 4;

                  if(code_checklist(4,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(4,1) = 1;
                  end
              elseif(strcmp('SecGridPoints',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 3;

                  if(code_checklist(3,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(3,1) = 1;
                  end
              elseif(strcmp('SecBoun',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 5;

                  if(code_checklist(5,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(5,1) = 1;
                  end
              elseif(strcmp('Warning',varargin{1,followvarg_cell}) == 1)

                  if(code_checklist(6,1)  == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(6,1) = 1;
                  end
              elseif(strcmp('WarningSpecs',varargin{1,followvarg_cell}) == 1)

                  if(code_checklist(7,1)  == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(7,1) = 1;
                  end
              elseif(strcmp('Progress',varargin{1,followvarg_cell}) == 1)

                  if(code_checklist(8,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(8,1) = 1;
                  end
              elseif(strcmp('Plot',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 9;

                  if(code_checklist(9,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(9,1) = 1;
                  end
              elseif(strcmp('Representation',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 10;

                  if(code_checklist(10,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(10,1) = 1;
                  end
              elseif(strcmp('Smooth',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 11;

                  if(code_checklist(11,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(11,1) = 1;
                  end
              elseif(strcmp('RepOneBoun',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 12;

                  if(code_checklist(12,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(12,1) = 1;
                  end
              elseif(strcmp('RepSecBoun',varargin{1,followvarg_cell}) == 1)
                  spec_flag = 13;

                  if(code_checklist(13,1) == 1)
                      error_flag(1,1) = 1;
                  else
                      code_checklist(13,1) = 1;
                  end
              else
                  error_flag(1,2) = 1;
              end

              if(error_flag(1,2) == 1)
                  error('MyError:ErrorPrevent','vecsurf Error - Option Code: Worng option code.');
              elseif(error_flag(1,1) == 1)
                  error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: An option code has been used\n' ...
                                            'more than one time.']));
              end

           else
              [inputmat_rowmax,inputmat_colmax] = size(varargin{1,followvarg_cell});

              switch spec_flag
                case {2}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 1])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''OneGridPoints'' Option Code: Specification matrix for\n' ...
                                        '''OneGridPoints'' must be a scalar.']));
                    end

                    if(0 == ([varargin{1,followvarg_cell} >= 2] & ...
                          [modt([varargin{1,followvarg_cell}*10],10) == 0]))
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''OneGridPoints'' Option Code: Worng value for ''OneGridPoints''\n' ...
                                         'specification matrix.']));
                    end

                case {3}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 1])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''SecGridPoints'' Option Code: Specification matrix for\n' ...
                                        '''SecGridPoints'' must be a scalar.']));
                    end

                    if(0 == ([varargin{1,followvarg_cell} >= 2] & ...
                          [modt([varargin{1,followvarg_cell}*10],10) == 0]))
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''SecGridPoints'' Option Code: Worng value for ''SecGridPoints''\n' ...
                                         'specification matrix.']));
                    end

                 case {4}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 2])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''OneBoun'' Option Code: Specification matrix for\n' ...
                                        '''OneBoun'' must be a one row vector of tow columns.']));
                    end

                    if(0 == (varargin{1,followvarg_cell}(1,1) < varargin{1,followvarg_cell}(1,2)))
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''OneBoun'' Option Code: First pattern of the ''OneBoun''\n' ...
                                     'specification matrix must be smaller that the second pattern.']));
                    end

                 case {5}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 2])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''SecBoun'' Option Code: Specification matrix for\n' ...
                                        '''SecBoun'' must be a one row vector of tow columns.']));
                    end

                    if(0 == (varargin{1,followvarg_cell}(1,1) < varargin{1,followvarg_cell}(1,2)))
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''SecBoun'' Option Code: First pattern of the ''SecBoun''\n' ...
                                     'specification matrix must be smaller that the second pattern.']));
                    end

                 case {9}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 1])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''Plot'' Option Code: Specification matrix for\n' ...
                                         '''Plot'' must be a scalar.']));
                    end

                    if([varargin{1,followvarg_cell} ~= 1] & [varargin{1,followvarg_cell} ~= 2])
                       error('MyError:ErrorPrevent',['vecsurf Error - ''Plot'' Option Code: Worng value for ''Plot'' parameters.']);

                    end

                  case{10}
                    if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 2])
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''Representation'' Option Code: Specification matrix for ''Representation''\n' ...
                                        'must be a one row vector of tow columns.']));
                    end

                    if(0 == ([(varargin{1,followvarg_cell}(1,1) >= 2) & (modt([varargin{1,followvarg_cell}(1,1)*10 ...
                             ],10) == 0)] & [(varargin{1,followvarg_cell}(1,2) >= 2) & (modt( ...
                             [varargin{1,followvarg_cell}(1,2)*10],10) == 0)]))
                       error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''Representation'' Option Code: Worng value for width and/or length\n' ...
                                      'of the representational three dimensional surface.']));
                    end
                  case{11}
                         if(inputmat_rowmax ~= 1 | inputmat_colmax ~= 3)
                            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''Smooth'' Option Code : Specification matrix for\n' ...
                                                    '''Smooth'' must be a one row vector of tow columns.']));
                         elseif(0 == ([varargin{1,followvarg_cell}(1,1) >= 2] & [modt([varargin{1,followvarg_cell}(1,1)*10],10) == 0] & ...
                                 [varargin{1,followvarg_cell}(1,2) >= 2] & [modt([varargin{1,followvarg_cell}(1,2)*10],10) == 0] & ...
                                 [varargin{1,followvarg_cell}(1,3) >= 1] & [modt([varargin{1,followvarg_cell}(1,3)*10],10) == 0]))
                            error('MyError:ErrorPrevent','vecsurf Error - ''Smooth'' Option Code: Worng value for ''Smooth'' parameters.');
                         end
                  case{12}
                      if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 2])
                          error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepOneBoun'' Option Code: Specification matrix for\n' ...
                                         '''RepOneBoun'' must be a one row vector of tow columns.']));
                      elseif(0 == [varargin{1,followvarg_cell}(1,1) < varargin{1,followvarg_cell}(1,2)])
                          error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepOneBoun'' Option Code: First pattern\n' ...
                                         'of the ''RepOneBoun'' specification matrix must be smaller then the second pattern.']));
                      end
                  otherwise
                      if([inputmat_rowmax ~= 1] | [inputmat_colmax ~= 2])
                          error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepSecBoun'' Option Code: Specification matrix for\n' ...
                                         '''RepSecBoun'' must be a one row vector of tow columns.']));
                      elseif(0 == [varargin{1,followvarg_cell}(1,1) < varargin{1,followvarg_cell}(1,2)])
                          error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepSecBoun'' Option Code: First pattern\n' ...
                                         'of the ''RepSecBoun'' specification matrix must be smaller then the second pattern.']));
                      end                                 
              end

              code_checklist(spec_flag,2) = 1;
              spec_flag = 0;
           end

           followvarg_cell = followvarg_cell + 1;   
        end

        if(0 == ([code_checklist(2,1) == 1 & code_checklist(2,2) == 1] | ...
              [code_checklist(2,1) == 0 & code_checklist(2,2) == 0]))
           error('MyError:ErrorPrevent','vecsurf Error - ''OneGridPoints'' Option Code: Specification matrix is missing.');
        end

        if(0 == ([code_checklist(3,1) == 1 & code_checklist(3,2) == 1] | ...
              [code_checklist(3,1) == 0 & code_checklist(3,2) == 0]))
           error('MyError:ErrorPrevent','vecsurf Error - ''SecGridPoints'' Option Code: Specification matrix is missing.');
        end

        if(0 == ([code_checklist(4,1) == 1 & code_checklist(4,2) == 1] | ...
              [code_checklist(4,1) == 0 & code_checklist(4,2) == 0]))
           error('MyError:ErrorPrevent','vecsurf Error - ''OneBoun'' Option Code: Specification matrix is missing.');
        end

        if(0 == ([code_checklist(5,1) == 1 & code_checklist(5,2) == 1] | ...
              [code_checklist(5,1) == 0 & code_checklist(5,2) == 0]))
           error('MyError:ErrorPrevent','vecsurf Error - ''SecBoun'' Option Code: Specification matrix is missing.');
        end

        if(0 == ([code_checklist(9,1) == 1 & code_checklist(9,2) == 1] | ...
              [code_checklist(9,1) == 0 & code_checklist(9,2) == 0]))
           error('MyError:ErrorPrevent','vecsurf Error - ''Plot'' Option Code: Specification matrix is missing.');
        end

        if([nargout ~= 0] & [code_checklist(9,1) == 1])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Return Matrices: When plot option is requested, demand\n' ...
                          'for return matrices is not allowed.']));
        end

        if([nargout ~= 3] & [code_checklist(9,1) == 0])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Return Matrices: When plot option is not requested, a demand for\n' ...
                          'three return matrices is requierd.']));
        end   

        if([code_checklist(2,1) == 0] & [code_checklist(4,1) == 1])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''OneBoun'' option code cannot be used without\n' ...
                          '''OneGridPoints'' option code activated.']));
        end

        if([code_checklist(3,1) == 0] & [code_checklist(5,1) == 1])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''SecBoun'' option code cannot be used without\n' ...
                          '''SecGridPoints'' option code activated.']));
        end

        if([code_checklist(6,1) == 0] & [code_checklist(7,1) == 1])
           error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''WarningSpecs'' option code cannot be used without\n' ...
                          '''Warning'' option code activated.']));
        end

        if(0 == ([(code_checklist(10,1) == 1) & (code_checklist(10,2) == 1)] | [(code_checklist(10,1) == 0) & ...
            (code_checklist(10,2) == 0)]))
            error('MyError:ErrorPrevent','vecsurf Error - ''Representation'' Option Code: specification matrix is missing.');
        end

        if(0 == ([(code_checklist(11,1) == 1) & (code_checklist(11,2) == 1)]  | [(code_checklist(11,1) == 0) & ...
                         (code_checklist(11,2) == 0)]))
            error('MyError:ErrorPrevent','vecsurf Error - ''Smooth'' Option Code: Specification matrix is missing.');
        end

        if([code_checklist(11,1) == 1] & [code_checklist(10,1) == 0])
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''Smooth'' cannot be activated without\n' ...
                           '''Representation'' option code activated']));
        end

        if(0 == ([(code_checklist(12,1) == 0) & (code_checklist(12,2) == 0)] | ...
           [(code_checklist(12,1) == 1) & (code_checklist(12,2) == 1)]))
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepOneBoun'' Option Code: Specification matrix\nis missing.']));
        end

        if((code_checklist(12,1) == 1) & (code_checklist(10,1) == 0))
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''RepOneBoun''' ...
                           ' cannot be activated without\n''Representation'' option code activated.']));
        end

        if(0 == ([(code_checklist(13,1) == 0) & (code_checklist(13,2) == 0)] | ...
           [(code_checklist(13,1) == 1) & (code_checklist(13,2) == 1)]))
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''RepSecBoun'' Option Code: Specification matrix\nis missing.']));
        end

        if((code_checklist(13,1) == 1) & (code_checklist(10,1) == 0))
            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: ''RepSecBoun''' ...
                           ' cannot be activated without\n''Representation'' option code activated.']));
        end


        %Debbuging for Variables and for Input & Output Parameters <-

        %Debbuging <-

        %Variable Definition:
        %onedim_rowmax           - row max of one_dimention
        %onedim_colmax           - col max of one_dimention
        %seconddim_rowmax        - row max of second_dimention
        %seconddim_colmax        - col max of second_dimention
        %thirddim_rowmax         - row max of third_dimention
        %thirddim_colmax         - col max of third_dimention
        %varg_cellmax            - cell matrix max for varargin
        %code_checkist           - presence list of options code
        %inputmat_rowmax         - row max for matrix cell in varargin
        %inputmat_colmax         - col max for matrix cell in varargin

        %Algoritem ->

        %Receiving Inputed Data ->

        one_dimention = 0;
        second_dimention = 0;
        third_dimention = 0;
        mosaicpicture_demand = 0;
        mosaiconed_gp = 0;
        mosaiconed_gpboun = 0;
        mosaicsecd_gp = 0;
        mosaicsecd_gpboun = 0;
        warning_demand = 0;
        warning_spec = 0;
        progress_demand = 0;
        plot_demand = 0;
        repsurf_demand = 0;
        smooth = 0;
        RepOneBoun = 0;
        RepSecBoun = 0;
        one_dimention = varargin{1,1};
        second_dimention = varargin{1,2};
        third_dimention = varargin{1,3};
        followvarg_cell = 4;
        spec_flag = 0;

        while(followvarg_cell <= varg_cellmax)

           if(spec_flag == 0)

               if(strcmp('MosaicPicture',varargin{1,followvarg_cell}) == 1)
                    mosaicpicture_demand = 1;
               elseif(strcmp('OneGridPoints',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 2;
               elseif(strcmp('SecGridPoints',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 3;
               elseif(strcmp('OneBoun',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 4;
               elseif(strcmp('SecBoun',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 5;
               elseif(strcmp('Warning',varargin{1,followvarg_cell}) == 1)
                    warning_demand = 1;
               elseif(strcmp('WarningSpecs',varargin{1,followvarg_cell}) == 1)
                    warning_spec = 1;
               elseif(strcmp('Progress',varargin{1,followvarg_cell}) == 1)
                    progress_demand = 1;
               elseif(strcmp('Plot',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 9;
               elseif(strcmp('Representation',varargin{1,followvarg_cell}) == 1)
                    spec_flag = 10;
               elseif(strcmp('Smooth',varargin{1,followvarg_cell}) == 1)
                   spec_flag = 11;
               elseif(strcmp('RepOneBoun',varargin{1,followvarg_cell}) == 1)
                   spec_flag = 12;
               elseif(strcmp('RepSecBoun',varargin{1,followvarg_cell}) == 1)
                   spec_flag = 13;

               else
                    error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Option Code: Debug for option codes faild. Contact\n' ...
                                            'support for help.']));
               end
           else	

              switch spec_flag
                case{2}
                    mosaiconed_gp = varargin{1,followvarg_cell};
                 case {3}
                    mosaicsecd_gp = varargin{1,followvarg_cell};
                 case {4}
                    mosaiconed_gpboun = varargin{1,followvarg_cell};
                 case {5}
                    mosaicsecd_gpboun = varargin{1,followvarg_cell};
                 case {9}
                    plot_demand = varargin{1,followvarg_cell};
                 case {10}
                    mosaicpicture_demand = 1;
                    repsurf_demand(1,1) = varargin{1,followvarg_cell}(1,1);
                    repsurf_demand(1,2) = varargin{1,followvarg_cell}(1,2);
                  case {11}
                      smooth = varargin{1,followvarg_cell};
                  case{12}
                      RepOneBoun = varargin{1,followvarg_cell};
                  case{13}
                      RepSecBoun = varargin{1,followvarg_cell};
                 otherwise
                    error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Specification Matrix: Worng specification flag. Contact\n' ...
                                    'support for help.']));
              end      

              spec_flag = 0;
           end

           followvarg_cell = followvarg_cell + 1;
        end

        if(size(repsurf_demand,2) == 2)

            if([mosaiconed_gp >= 1] | [size(mosaiconed_gpboun,2) == 2] | [mosaicsecd_gp >= 1] | [size(mosaicsecd_gpboun,2) == 2])
                disp(sprintf(['vecsurf Warning - When Representational Three Dimensional Surface\n' ...
                                        'is on, Mosaic Grid Points options do not have an effect.']));
                mosaiconed_gp = 0;
                mosaiconed_gpboun = 0;
                mosaicsecd_gp = 0;
                mosaicsecd_gpboun = 0;
                gridonedim_rowmax = 1;
                gridseconddim_rowmax = 1;
            else
                gridonedim_rowmax = 1;
                gridseconddim_rowmax = 1;
            end
        end

        varargin{1,1} = 0;
        varargin{1,2} = 0;
        varargin{1,3} = 0;

        %Receiving Inputed Data <-

        %Progress Bar Reset Code Interrupt ->

        if(progress_demand == 1)
           precent100_pro = 10*(size(repsurf_demand,2) ~= 2) + 15*(size(repsurf_demand,2) ~= 2) + 10*(size(repsurf_demand,2) ~= 2) ...
                                              + 10*(size(repsurf_demand,2) == 2) + 5*warning_demand +15*(mosaiconed_gp >= 2) + ...
                                               15*(mosaicsecd_gp >= 2) + 30*mosaicpicture_demand + (size(smooth,2) == 3)*15;
           lastp_print(1,1:2) = 0;
           precent_status = 0;

           if(ishandle(handles.protex) == 1)
               try
                  set(handles.prowin,'visible','on');
               end
           end

           if(ishandle(handles.protex) == 1)
              axis([1,100,1,2]);
              axis off;
           end

           minp_p(1,1) = 0.01*precent100_pro;
           minp_p(1,2) = 0.01*precent100_pro;
        end

        %Progress Bar Reset Code Interrupt <-

        %Alerting the Programmer for Double Patterns ->

        %Action I ->

        if(warning_demand == 1)

           %Action I <-

           %Progress Bar Advancement Beginnings Code Interrupt ->

           if(progress_demand == 1)
            valpre_start = precent_status;
            seg_val = 5;
           end

           %Progress Bar Advancement Beginnings Code Interrupt <-

           %Action II ->

           pattern_max = onedim_rowmax;
           pattern_flag([1:pattern_max],1) = 0;
           warning_flag = 0;

           %Action II <-

           %Action III ->

           followdespat_row = 0;

           %Action III <-

           %Action IV ->

           flag_aivbiix_RV = 0;

           while(flag_aivbiix_RV == 0)
              flag_iv_a = 0;

              while([followdespat_row < pattern_max] & [flag_iv_a == 0])
                 followdespat_row = followdespat_row + 1;

                 if(pattern_flag(followdespat_row,1) ~= 1)
                    flag_iv_a = 1;
                 end
              end

              if(flag_iv_a == 1)

                %Action IV <-

                 %Progress Bar Advancement Middle Code Interrupt ->

                 if(progress_demand == 1)
                    segsta_pre = valpre_start + [(seg_val*(followdespat_row/pattern_max))/precent100_pro]*100;

                    if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                       lastp_print(1,1) = segsta_pre;

                       if(ishandle(handles.protex) == 1)
                            try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                            end
                                
                            if(ishandle(handles.protex) == 1)
                                 drawnow;
                            else
                                 try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                 end
                            end
                       end
                    end

                    if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                       lastp_print(1,2) = segsta_pre;

                       if(gcf == handles.prowin)
                          try
                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                            drawnow;
                          end
                       end
                    end
                 end

                 %Progress Bar Advancement Middle Code Interrupt <-

                 %Action V ->

                 num_same = 0;
                 patternwarning_flag = 0;
                 followspepat_row = 0;
                 type_ind = 0;
                 warning_string = 0;
                 type_flag = 0;

                %Action V <-

                %Action VI ->

                while([followspepat_row < pattern_max] & [flag_aivbiix_RV == 0])
                    followspepat_row = followspepat_row + 1;

                    %Action VI <-

                    %Action VII ->

                    same_flag = 0;

                    if([one_dimention(followdespat_row,1) == one_dimention(followspepat_row,1)] & ...
                        [second_dimention(followdespat_row,1) == second_dimention(followspepat_row,1)])
                        num_same = num_same + 1;
                        pattern_flag(followspepat_row,1) = 1;
                        same_flag = 1;
                    end

                    %Action VII <-

                    %Action IIX ->

                    if(num_same >= 2)

                        if(warning_flag == 0)
                        disp(sprintf(['\nvecsurf Warning !!!: Number of third dimension patterns for the\n' ...
                                          'same first and second dimension pattern.']));  
                            warning_flag = 1;           
                        end

                        if(warning_spec == 1)

                        if(patternwarning_flag == 0)
                             disp(sprintf(['\nvecsurf Warning Findings Specification: The pattern in the %d row' ...
                                              '\nuses the same one and second dimension pattern as the patterns in the ' ...
                                              'following rows:\n'],followdespat_row));
                            patternwarning_flag = 1;
                        end

                          if([same_flag == 1] & [followdespat_row ~= followspepat_row])
                             create_string = 0;

                             if(type_ind > 20)
                                create_string = sprintf('%d\n',followspepat_row);
                                type_ind = 0;
                             else
                                create_string = sprintf('%d ',followspepat_row);
                             end

                             createstr_colmax = size(create_string,2);
                             type_ind = type_ind + 1;
                             warningstr_colmax = size(warning_string,2);

                             if(type_flag == 0)
                                warning_string(1,1:createstr_colmax) = create_string(1,1:createstr_colmax);
                                type_flag = 1;
                             else
                                warning_string(1,[(warningstr_colmax + 1):(warningstr_colmax + createstr_colmax)]) = ...
                                       create_string(1,1:createstr_colmax);
                             end   
                          end
                       else

                          if(warning_flag == 1)
                             flag_aivbiix_RV = 1;
                          end
                       end
                    end

                    %Action IIX <-

                    %Action VI ->

                  end

                  if(patternwarning_flag == 1)
                     warning_string = char(warning_string);
                     disp(warning_string);
                  end

                %Action VI <-

                %Action IV ->

              end

              if(followdespat_row >= pattern_max)
                 flag_aivbiix_RV = 1;
              end
           end

           %Action IV <-

           %Progress Bar Finishing Code Interrupt ->

           if(progress_demand == 1)
            precent_status = segsta_pre;
           end

           %Progress Bar Finishing Code Interrupt <-

           %Action I ->

        end

        %Action I <-

        %Alerting the Programmer for Double Patterns <-

        %Creating A Representational Three Dimensional Surface ->

        %Action I ->

        if(size(repsurf_demand,2) == 2)

           %Action I <-

           %Progress Bar Advancement Beginnings Code Interrupt ->

           if(progress_demand == 1)
            valpre_start = precent_status;
            seg_val = 10;
           end

            %Progress Bar Advancement Beginnings Code Interrupt <-

           %Action II ->

           orgpat_max = size(one_dimention,1);
           thirddim_3d(1:(repsurf_demand(1,2)),1:(repsurf_demand(1,1))) = 0;
           DataInRepSurf_Flag = 0;
           
           %Action II <-

           %Action III ->

           if(size(RepOneBoun,2) == 1)
                onedim_boun(1,1) = min(one_dimention);
                onedim_boun(1,2) = max(one_dimention);
           else
                onedim_boun(1,1) = RepOneBoun(1,1);
                onedim_boun(1,2) = RepOneBoun(1,2);
           end

           if(size(RepSecBoun,2) == 1)
                seconddim_boun(1,1) = min(second_dimention);
                seconddim_boun(1,2) = max(second_dimention);
           else
               seconddim_boun(1,1) = RepSecBoun(1,1);
               seconddim_boun(1,2) = RepSecBoun(1,2);
           end

           %Action III <-

           %Action XX ->

            if(onedim_boun(1,1) == onedim_boun(1,2))
                error('MyError:ErrorPrevent',sprintf('MyError:ErrorPrevent',['vecsurf Error - Insufficient Data For Dimension One:\n' ...
                               'Representational Three Dimensional Surface cannot work with insufficient\n' ...
                               'data. Try using the Representational Three Dimensional Surface Grid Value Boundry\n' ...
                               'option for dimension one.']));
            end

           if(seconddim_boun(1,1) == seconddim_boun(1,2))
                error('MyError:ErrorPrevent',sprintf('MyError:ErrorPrevent',['vecsurf Error - Insufficient Data For Dimension Tow:\n' ...
                               'Representational Three Dimensional Surface cannot work with insufficient\n' ...
                               'data. Try using the Representational Three Dimensional Surface Grid Value Boundry\n' ...
                               'option for dimension tow.']));
            end

           %Action XX <-

           %Action IV ->

           onedim_bounposb = linspace(onedim_boun(1,1),onedim_boun(1,2),[repsurf_demand(1,1)]);
           seconddim_bounposb = linspace(seconddim_boun(1,1),seconddim_boun(1,2),[repsurf_demand(1,2)]);
           onedimbp_patmax = size(onedim_bounposb,2);
           seconddimbp_patmax = size(seconddim_bounposb,2);

           %Action IV <-

           %Action V ->

           towdim_boungrid([1:repsurf_demand(1,2)],[1:repsurf_demand(1,1)]) = 0;

           %Action V <-

           %Action VI ->

           followorgdim_pat = 0;

           %Action VI <-

           %Action VII ->

           while(followorgdim_pat < orgpat_max)
              followorgdim_pat = followorgdim_pat + 1;

              %Action VII <-

              %Progress Bar Advancement Middle Code Interrupt ->

            if(progress_demand == 1)
                segsta_pre = valpre_start + [(seg_val*[followorgdim_pat/orgpat_max])/precent100_pro]*100;

                if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                    lastp_print(1,1) = segsta_pre;

                    if(ishandle(handles.protex) == 1)
                         try
                              set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                              patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                         end
                                
                         if(ishandle(handles.protex) == 1)
                              drawnow;
                         else
                             try
                                  clf  (handles.prowin);
                                  delete (handles.prowin);
                             end
                         end
                    end
                end

                if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                    lastp_print(1,2) = segsta_pre;

                    if(gcf == handles.prowin)
                        try
                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                            drawnow;
                        end
                    end
                end
            end  

            %Progress Bar Advancement Middle Code Interrupt <-

              %Action IX ->

              followonedbp_pat = 0;
              onebounfound_ind = 0;

              %Action IX <-

              %Action X ->

              while([followonedbp_pat < (onedimbp_patmax - 1)] & [onebounfound_ind == 0])
                 followonedbp_pat = followonedbp_pat + 1;

                 %Action X <-

                 %Action XII ->

                 if([one_dimention(followorgdim_pat,1) >= onedim_bounposb(1,followonedbp_pat)] & ...
                    [one_dimention(followorgdim_pat,1) <= onedim_bounposb(1,[followonedbp_pat + 1])])
                    onebounfound_ind = followonedbp_pat;
                 end

                 %Action XII <-

                 %Action X ->

              end

              %Action X <-

              %Action XI ->

              followseconddbp_pat = 0;
              secbounfound_ind = 0;

              %Action XI <-

              %Action IIXV ->

              while([followseconddbp_pat < (seconddimbp_patmax - 1)] & [secbounfound_ind == 0])
                 followseconddbp_pat = followseconddbp_pat + 1;

                 %Action IIXV <-

                 %Action XV ->

                 if([second_dimention(followorgdim_pat,1) >= seconddim_bounposb(1,followseconddbp_pat)] & ...
                    [second_dimention(followorgdim_pat,1) <= seconddim_bounposb(1,[followseconddbp_pat + 1])])
                       secbounfound_ind = followseconddbp_pat;
                 end

                 %Action XV <-

                 %Action IIXV ->

              end

              %Action IIXV <-

              %Action IXV ->

              if([onebounfound_ind ~= 0] & [secbounfound_ind ~= 0])

                %Action IXV <-

                  %Action XVI ->

                  if(towdim_boungrid(secbounfound_ind,onebounfound_ind) == 0)

                     %Action XVI <-

                     %Action IIXX ->

                     towdim_boungrid(secbounfound_ind,onebounfound_ind)  = 1;

                     if(third_dimention(followorgdim_pat,1) == 0)
                        thirddim_3d(secbounfound_ind,onebounfound_ind) = 0.00000001;
                     else
                        thirddim_3d(secbounfound_ind,onebounfound_ind) = third_dimention(followorgdim_pat,1);
                     end
                     
                     DataInRepSurf_Flag = 1;
                     
                     %Action IIXX <-

                     %Action XVI ->

                  end

                  %Action XVI <-

                  %Action IXV ->

              end

              %Action IXV <-

              %Action VII ->

           end

           %Action VII <-

           %Progress Bar Finishing Code Interrupt ->

           if(progress_demand == 1)
            precent_status = segsta_pre;
           end

           %Progress Bar Finishing Code Interrupt <-

           %Action IIX ->

           onedim_3d = onedim_bounposb;
           seconddim_3d = seconddim_bounposb';
           onedim3d_colmax = onedimbp_patmax;
           seconddim3d_rowmax = seconddimbp_patmax;
           thirddim3d_rowmax = seconddimbp_patmax;
           thirddim3d_colmax = onedimbp_patmax;
           towdim_boungrid = 0;
           onedim_bounposb = 0;
           seconddim_bounposb = 0;
           one_dimention = 0;
           second_dimention = 0;
           third_dimention = 0;
           
           if(DataInRepSurf_Flag == 0)
               error('MyError:ErrorPrevent',sprintf(['vecsurf Error - ''Representation'' Option Code: No data points\n' ...
                              'were identified in the Representational Three Dimensional Surface. Possible\n' ...
                              'misuse of Representational Three Dimensional Surface Grid Value Boundry option. Try\n' ...
                              'changeing the value boundry for one where there might be data points.']));
           end
           
           %Action IIX <-

           %Action I ->

        end

        %Action I <-

        %Creating A Representational Three Dimensional Surface <-

        %Value Size Ordering Operation In The Vector of The First And Second Dimentions ->

        %Action XVII ->

        if(size(repsurf_demand,2) == 1)

                 %Action XVII <-

                %Progress Bar Advancement Beginnings Code Interrupt ->

                   if(progress_demand == 1)
                    valpre_start = precent_status;
                    seg_val = 10;
                   end

                %Progress Bar Advancement Beginnings Code Interrupt <-

                %Action I ->

                onedim_rowmax = size(one_dimention,1);
                seconddim_rowmax = size(second_dimention,1);

                %Action I <-

                %Action II ->

                orgonedim_rowmax = onedim_rowmax;
                orgone_dimention = one_dimention;
                org_row = -1;

                %Action II <-

                %Action III ->

                while(org_row < [orgonedim_rowmax - 2])
                   org_row = org_row + 1;
                   followorgoned_row = org_row + 1;
                   min_value = orgone_dimention(followorgoned_row,1);
                   minv_row = followorgoned_row;

                   %Action III <-

                   %Progress Bar Advancement Middle Code Interrupt ->

                   if(progress_demand == 1)
                      segsta_pre = valpre_start + [(seg_val*[(org_row/(orgonedim_rowmax - 1))*0.5])/precent100_pro]*100;

                      if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;

                         if(ishandle(handles.protex) == 1)
                             try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                             end
                                
                             if(ishandle(handles.protex) == 1)
                                 drawnow;
                             else
                                 try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                 end
                             end
                         end
                      end

                      if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                         lastp_print(1,2) = segsta_pre;

                         if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                            end
                         end
                      end
                   end  

                   %Progress Bar Advancement Middle Code Interrupt <-

                   %Action IV ->

                   while(followorgoned_row <= orgonedim_rowmax)

                      if(orgone_dimention(followorgoned_row,1) < min_value)
                         min_value = orgone_dimention(followorgoned_row,1);
                         minv_row = followorgoned_row;
                      end

                      followorgoned_row = followorgoned_row + 1;
                   end

                   %Action IV <-

                   %Action V ->

                   exchange_var = orgone_dimention([org_row + 1],1);
                   orgone_dimention([org_row + 1],1) = orgone_dimention(minv_row,1);
                   orgone_dimention(minv_row,1) = exchange_var;

                   %Action V <-

                   %Action VI ->

                   one_dimention(minv_row,1) = org_row + 1;

                   %Action VI <-

                   %Action XV ->

                   exchange_var = one_dimention(minv_row,1);
                   one_dimention(minv_row,1) = one_dimention([org_row + 1],1);
                   one_dimention([org_row + 1],1) = exchange_var;
                   exchange_var = second_dimention(minv_row,1);
                   second_dimention(minv_row,1) = second_dimention([org_row + 1],1);
                   second_dimention([org_row + 1],1) = exchange_var;
                   exchange_var = third_dimention(minv_row,1);
                   third_dimention(minv_row,1) = third_dimention([org_row + 1],1);
                   third_dimention([org_row + 1],1) = exchange_var;

                   %Action XV <-

                   %Action III ->

                end

                %Action III <-

                %Action IXV ->

                one_dimention(orgonedim_rowmax,1) = orgonedim_rowmax;

                %Action IXV <-

                %Action VII ->

                orgsecond_dimention = second_dimention;
                orgseconddim_rowmax = seconddim_rowmax;
                org_row = -1;

                %Action VII <-

                %Action IX ->

                while(org_row < [orgseconddim_rowmax - 2])
                   org_row = org_row + 1;
                   followorgsecondd_row = org_row + 1;
                   min_value = orgsecond_dimention(followorgsecondd_row,1);
                   minv_row = followorgsecondd_row;

                   %Action IX <-

                   %Progress Bar Advancement Middle Code Interrupt ->

                   if(progress_demand == 1)
                      segsta_pre = valpre_start + [(seg_val*[0.5 + (org_row/(orgseconddim_rowmax - 1))*0.5])/precent100_pro]*100;

                      if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;

                         if(ishandle(handles.protex) == 1)
                              try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                              end
                                
                              if(ishandle(handles.protex) == 1)
                                   drawnow;
                              else
                                  try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                  end
                             end
                          end
                      end

                      if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                         lastp_print(1,2) = segsta_pre;

                         if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                            end
                         end
                      end
                   end  

                   %Progress Bar Advancement Middle Code Interrupt <-

                   %Action X ->

                   while(followorgsecondd_row <= orgseconddim_rowmax)

                      if(orgsecond_dimention(followorgsecondd_row,1) < min_value)
                         min_value = orgsecond_dimention(followorgsecondd_row,1);
                         minv_row = followorgsecondd_row;
                      end

                      followorgsecondd_row = followorgsecondd_row + 1;
                   end

                   %Action X <-

                   %Action XI ->

                   exchange_var = orgsecond_dimention([org_row + 1],1);
                   orgsecond_dimention([org_row + 1],1) = orgsecond_dimention(minv_row,1);
                   orgsecond_dimention(minv_row,1) = exchange_var;

                   %Action XI <-

                   %Action XII ->

                   second_dimention(minv_row,1) = org_row + 1;

                   %Action XII <-

                   %Action XVI ->

                   exchange_var = one_dimention(minv_row,1);
                   one_dimention(minv_row,1) = one_dimention([org_row + 1],1);
                   one_dimention([org_row + 1],1) = exchange_var;
                   exchange_var = second_dimention(minv_row,1);
                   second_dimention(minv_row,1) = second_dimention([org_row + 1],1);
                   second_dimention([org_row + 1],1) = exchange_var;
                   exchange_var = third_dimention(minv_row,1);
                   third_dimention(minv_row,1) = third_dimention([org_row + 1],1);
                   third_dimention([org_row + 1],1) = exchange_var;

                   %Action XVI <-

                   %Action IX ->

                end

                %Action IX <-

                %Action IIXV ->

                second_dimention(orgseconddim_rowmax,1) = orgseconddim_rowmax;

                %Action IIXV <-

                %Progress Bar Finishing Code Interrupt ->

                   if(progress_demand == 1)
                    precent_status = segsta_pre;
                   end

                %Progress Bar Finishing Code Interrupt <-

                %Action XVII ->

        end

        %Action XVII <-

        %Value Size Ordering Operation In The Vector of The First And Second Dimentions <-

        %Creating a Tow Dimentional Grid ->

        %Action XX ->

        if(size(repsurf_demand,2) == 1)

                %Action XX <-

                %Progress Bar Advancement Beginnings Code Interrupt ->

                   if(progress_demand == 1)
                    valpre_start = precent_status;
                    seg_val = 15;
                   end

                %Progress Bar Advancement Beginnings Code Interrupt <-

                %Action I ->

                gridone_dimention = 0;
                gridsecond_dimention = 0;

                %Action I <-

                %Action II ->

                followorgoned_row = 1;
                grid_point = 0;
                start_set = 1;
                set_value = orgone_dimention(1,1);

                %Action II <-

                %Action III ->

                while(followorgoned_row < orgonedim_rowmax)
                   followorgoned_row = followorgoned_row + 1;

                   %Action III <-

                   %Progress Bar Advancement Middle Code Interrupt ->

                   if(progress_demand == 1)
                      segsta_pre = valpre_start + [(seg_val*[(followorgoned_row/orgonedim_rowmax)*0.5])/precent100_pro]*100;

                      if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;

                         if(ishandle(handles.protex) == 1)
                             try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                             end
                                
                             if(ishandle(handles.protex) == 1)
                                 drawnow;
                             else
                                try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                end
                             end
                         end
                      end

                      if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                         lastp_print(1,2) = segsta_pre;

                         if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                          end
                         end
                      end
                   end  

                   %Progress Bar Advancement Middle Code Interrupt <-

                   %Action V ->

                   flag_v_III = 0;

                   if(orgone_dimention(followorgoned_row,1) == set_value)
                      flag_v_III = 1;
                   end

                   if(flag_v_III == 0)

                    %Action V <-

                    %Action VI ->

                      grid_point = grid_point + 1;
                      gridone_dimention(grid_point,1) = set_value;

                      %Action VI <-

                      %Action VII ->

                      end_set = followorgoned_row - 1;
                      orgone_dimention([start_set:end_set],1) = grid_point;

                      %Action VII <-

                      %Action IIX ->

                      set_value = orgone_dimention(followorgoned_row,1);
                      start_set = followorgoned_row;

                      %Action IIX <-

                      %Action V ->
                   end

                   %Action V <-

                   %Action III ->

                end

                %Action III <-

                %Action IV ->

                grid_point = grid_point + 1;
                gridone_dimention(grid_point,1) = set_value;

                %Action IV <-

                %Action IX ->

                end_set = followorgoned_row;
                orgone_dimention([start_set:end_set],1) = grid_point;
                gridonedim_rowmax = grid_point;

                if([gridonedim_rowmax == 1] & [mosaiconed_gp == 0])
                   error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Insufficient Data: Insufficient data for the\n' ...
                                   'creation of a three dimentional surface. To overcome this problom try\n' ...
                                    'mosaic grid points option.']));
                end

                %Action IX <-

                %Action X ->

                followoned_row = 1;

                while(followoned_row <= onedim_rowmax)
                   one_dimention(followoned_row,1) = orgone_dimention([one_dimention(followoned_row,1)],1);
                   followoned_row = followoned_row + 1;
                end

                orgone_dimention = 0;

                %Action X <-

                %Action XI ->

                followorgsecondd_row = 1;
                grid_point = 0;
                start_set = 1;
                set_value = orgsecond_dimention(1,1);

                %Action XI <-

                %Action XII ->

                while(followorgsecondd_row < orgseconddim_rowmax)
                   followorgsecondd_row = followorgsecondd_row + 1;

                   %Action XII <-

                   %Progress Bar Advancement Middle Code Interrupt ->

                   if(progress_demand == 1)
                      segsta_pre = valpre_start + [(seg_val*[0.5 + (followorgsecondd_row/orgseconddim_rowmax)*0.5])/ ...
                         precent100_pro]*100;

                      if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;

                         if(ishandle(handles.protex) == 1)
                             try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                             end
                             
                             if(ishandle(handles.protex) == 1)
                                 drawnow;
                             else
                                try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                end
                             end
                         end
                      end

                      if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                         lastp_print(1,2) = segsta_pre;

                         if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                            end
                         end
                      end
                   end  

                   %Progress Bar Advancement Middle Code Interrupt <-

                   %Action IXV ->

                   flag_ixv_XII = 0;

                   if(orgsecond_dimention(followorgsecondd_row,1) == set_value)
                      flag_ixv_XII = 1;
                   end

                   if(flag_ixv_XII == 0)

                      %Action IXV <-

                      %Action XV ->

                      grid_point = grid_point + 1;
                      gridsecond_dimention(grid_point,1) = set_value;

                      %Action XV <-

                      %Action XVI ->

                      end_set = followorgsecondd_row - 1;
                      orgsecond_dimention([start_set:end_set],1) = grid_point;

                      %Action XVI <-

                      %Action XVII ->

                      set_value = orgsecond_dimention(followorgsecondd_row,1);
                      start_set = followorgsecondd_row;

                      %Action XVII <-

                      %Action IXV ->

                   end

                   %Action IXV <-

                   %Action XII ->

                end

                %Action XII <-

                %Action IIXV ->

                grid_point = grid_point + 1;
                gridsecond_dimention(grid_point,1) = set_value;

                %Action IIXV <-

                %Action IIXX ->

                end_set = followorgsecondd_row;
                orgsecond_dimention([start_set:end_set],1) = grid_point;
                gridseconddim_rowmax = grid_point;

                if([gridseconddim_rowmax == 1] & [mosaicsecd_gp == 0])
                   error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Insufficient Data: Insufficient data for the\n' ...
                                      'creation of a three dimentional surface. To overcome this problom try\n' ...
                                  'mosaic grid points option.']));
                end

                %Action IIXX <-

                %Action IXX ->

                followsecondd_row = 1;

                while(followsecondd_row <= seconddim_rowmax)
                   second_dimention(followsecondd_row,1) = orgsecond_dimention([second_dimention(followsecondd_row,1)],1);
                   followsecondd_row = followsecondd_row + 1;
                end

                orgsecond_dimention = 0;

                %Action IXX <-

                %Progress Bar Finishing Code Interrupt ->

                   if(progress_demand == 1)
                    precent_status = segsta_pre;
                   end

                %Progress Bar Finishing Code Interrupt <-

                %Action XX ->

        end

        %Action XX <-

        %Creating a Tow Dimentional Grid <-

        %Creating Mosaic Grid Points ->

        %Progress Bar Advancement Beginnings Code Interrupt ->

           if(progress_demand == 1)
            valpre_start = precent_status;
              seg_val = 30;
              proggpb_oneflag = 0;
              proggpb_secflag = 0;
           end

        %Progress Bar Advancement Beginnings Code Interrupt <-

        %Action XVI ->

        gridpoints_sdimincrement = 0;
        gridpoints_odimincrement = 0;

        %Action XVI <-

        %Action IIXXXXX ->

        followosorder_col = 0;
        onesecd_order = 0;

        %Action IIXXXXX <-

        %Action IXXXXX ->

        if([size(mosaicsecd_gpboun,2) == 2] & [size(mosaicsecd_gpboun,2) ~= 2])
           onesecd_order(1,1) = 2;
           onesecd_order(1,2) = 1;
           osorder_colmax = 2;
        else
           onesecd_order(1,1) = 1;
           onesecd_order(1,2) = 2;
           osorder_colmax = 2;
        end

        %Action IXXXXX <-

        %Action XXXXX->

        while(followosorder_col < osorder_colmax)
           followosorder_col = followosorder_col + 1;

           %Action XXXXX <-

           %Action XXXXXI ->

           if(onesecd_order(1,followosorder_col) == 1)

              %Action XXXXXI <-

                %Action I ->

                if(gridonedim_rowmax < mosaiconed_gp)

                %Action I <-

                 %Progress Bar Advancement Beginnings Code Interrupt ->

                 proggpb_oneflag = 1;

                 %Progress Bar Advancement Beginnings Code Interrupt <-

                %Action IIXX ->

                     if(size(mosaiconed_gpboun,2) == 2)

                    %Action IIXX <-

                    %Action XXXII ->

                    gridpoints_odimincrement = 0;

                    if(gridonedim_rowmax == 1)
                        gridpoints_odimincrement = [gridone_dimention(1,1) - mosaiconed_gpboun(1,1)] + ...
                                 [mosaiconed_gpboun(1,2) - gridone_dimention(1,1)];
                    else      
                        followgridoned_row = 2;

                        while(followgridoned_row <= gridonedim_rowmax)
                            gridpoints_odimincrement = gridpoints_odimincrement + [gridone_dimention(followgridoned_row,1) - ...
                                gridone_dimention([followgridoned_row - 1],1)];
                            followgridoned_row = followgridoned_row + 1;
                        end

                    end

                    %Action XXXII <-

                    %Action IXX ->

                    nump_sum = 0;

                    if(gridonedim_rowmax == 1)
                            onesumdef_grid = gridpoints_odimincrement;
                    else
                        onesumdef_grid = [gridpoints_odimincrement] + [mosaiconed_gpboun(1,2) - ...
                            gridone_dimention(gridonedim_rowmax,1)] + [gridone_dimention(1,1) - mosaiconed_gpboun(1,1)];
                    end

                    numplus_gridpoints = mosaiconed_gp - gridonedim_rowmax;
                    gridpoints_odimincrement = 0;
                    numleft_gridpoints = numplus_gridpoints - 1;

                    %Action IXX <-

                    %Action XX ->

                    if([gridone_dimention(1,1) < mosaiconed_gpboun(1,1)] |  ...
                            [gridone_dimention(gridonedim_rowmax,1) > mosaiconed_gpboun(1,2)]) 
                            error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Mosaic Grid Points Boundry: Vector of the first ' ...
                                                'dimension\nhave data located outsdide the boundry zone.']));
                    end

                    %Actionn XX <-

                    %Action XXI ->

                    if(gridone_dimention(1,1) == mosaiconed_gpboun(1,1))

                        %Action XXI <-

                        %Action XXVI ->

                        numleft_gridpoints = numplus_gridpoints;
                        mosaicgrid_create = 0;
                        mosaicgrid_create(1,1) = gridone_dimention(1,1);
                        mosaicgc_rowmax = 1;

                        %Action XXVI <-

                        %Action XXI ->

                    else

                        %Action XXI <-

                        %Action XXII ->

                        num_p = [(gridone_dimention(1,1) - mosaiconed_gpboun(1,1))/onesumdef_grid]*numplus_gridpoints;

                        if(num_p >= 1)
                            nump_reminder = modt(num_p*10,10);
                            num_p = floor(num_p);
                            nump_sum = nump_sum + nump_reminder;

                            if(nump_sum >= 1)
                                numpsum_reminder = modt(nump_sum*10,10);
                                num_p = num_p + floor(nump_sum);
                                nump_sum = numpsum_reminder;
                            end

                        else 
                            nump_sum = nump_sum + num_p;

                            if(nump_sum >= 1) 
                                num_p = floor(nump_sum);
                                numpsum_reminder = modt(nump_sum*10,10);
                                nump_sum = numpsum_reminder;
                            else
                                num_p = 0;
                            end

                        end

                        if(num_p > numleft_gridpoints)
                            num_p = numleft_gridpoints;
                        end

                        if(num_p >= 1)
                            vec_bp = linspace(mosaiconed_gpboun(1,1),gridone_dimention(1,1),[num_p + 2]);
                            vec_bp = vec_bp';
                        else
                            vec_bp = gridone_dimention(1,1);
                            vec_bp = vec_bp';
                        end

                        %Action XXII <-

                        %Action IIXXV ->

                        mosaicgrid_create = 0;

                        if(num_p >= 1)
                            mosaicgrid_create([1:(num_p + 2)],1) = vec_bp;
                            mosaicgc_rowmax = num_p + 2;
                            numleft_gridpoints = numleft_gridpoints - num_p;
                        else
                            mosaicgrid_create(1,1) = vec_bp;
                            mosaicgc_rowmax = mosaicgc_rowmax + 1;
                        end

                        %Action IIXXV <-

                        %Action IXXV ->

                        if(num_p >= 1)
                            point_change = num_p + 1;
                            one_dimention(1:onedim_rowmax,1) = one_dimention(1:onedim_rowmax,1) + point_change;
                        end

                        %Action IXXV <-

                        %Action XXI ->

                    end

                    %Action XXI <-

                    %Action XXV ->

                    pointco_flag = 0;
                    followgridoned_row = 0;
                    oldgridoned_rowmax = gridonedim_rowmax;

                    if(numleft_gridpoints > 0)

                        if(gridone_dimention(gridonedim_rowmax,1) ~= mosaiconed_gpboun(1,2))
                            pointco_flag = 1;
                            gridonedim_rowmax = gridonedim_rowmax + 1;
                            numleft_gridpoints = numleft_gridpoints - 1;
                            gridone_dimention(gridonedim_rowmax,1) = mosaiconed_gpboun(1,2);
                        end
                    end

                    %Action XXV <-

                    %Action XXVII ->

                    while([followgridoned_row < (gridonedim_rowmax - 1)] & [numleft_gridpoints > 0])
                       followgridoned_row = followgridoned_row + 1;

                        %Action XXVII <-

                       %Progress Bar Advancement Middle Code Interrupt ->

                        if(progress_demand == 1)
                        segsta_pre = valpre_start + [(seg_val*[(followgridoned_row/[gridonedim_rowmax - 1])*0.5 +  ... 
                              (proggpb_secflag == 1)*0.5])/precent100_pro]*100;

                            if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                lastp_print(1,1) = segsta_pre;

                                if(ishandle(handles.protex) == 1)
                                    try
                                       set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                       patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                    end
                                
                                    if(ishandle(handles.protex) == 1)
                                        drawnow;
                                    else
                                        try
                                            clf  (handles.prowin);
                                            delete (handles.prowin);
                                        end
                                    end
                                end
                            end

                            if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                    lastp_print(1,2) = segsta_pre;

                                    if(gcf == handles.prowin)
                                        try
                                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                            drawnow;
                                        end
                                    end
                            end
                        end  

                        %Progress Bar Advancement Middle Code Interrupt <-

                        %Action IXXX ->

                        num_p = [(gridone_dimention([followgridoned_row + 1],1) - ...
                            gridone_dimention(followgridoned_row,1))/onesumdef_grid]*numplus_gridpoints;

                        if(num_p >= 1)
                            nump_reminder = modt(num_p*10,10);
                            num_p = floor(num_p);
                            nump_sum = nump_sum + nump_reminder;

                            if(nump_sum >= 1)
                                numpsum_reminder = modt(nump_sum*10,10);
                                num_p = num_p + floor(nump_sum);
                                nump_sum = numpsum_reminder;
                            end

                        else 
                            nump_sum = nump_sum + num_p;

                            if(nump_sum >= 1) 
                                num_p = floor(nump_sum);
                                numpsum_reminder = modt(nump_sum*10,10);
                                nump_sum = numpsum_reminder;
                            else
                                num_p = 0;
                            end

                        end

                        if([num_p > numleft_gridpoints] | [(followgridoned_row - 1) ==  ...
                                gridonedim_rowmax])
                            num_p = numleft_gridpoints;
                        end

                        if(num_p >= 1)
                            vec_bp = linspace(gridone_dimention(followgridoned_row,1), ...
                                gridone_dimention([followgridoned_row + 1],1),[num_p + 2]);
                            vec_bp = vec_bp';
                        else
                            vec_bp = gridone_dimention([followgridoned_row + 1],1);
                            vec_bp = vec_bp';
                        end

                        %Action IXXX <-

                        %Action XXX ->

                        if(num_p >= 1)
                            mosaicgrid_create([(mosaicgc_rowmax + 1):(mosaicgc_rowmax + 1 + num_p)],1) = vec_bp([2:(num_p + 2)],1);
                            mosaicgc_rowmax = mosaicgc_rowmax + 1 + num_p;
                            numleft_gridpoints = numleft_gridpoints - num_p;
                        else
                            mosaicgrid_create(mosaicgc_rowmax + 1,1) = vec_bp;
                            mosaicgc_rowmax = mosaicgc_rowmax + 1;
                        end

                        %Action XXX <-

                        %Action XXXI ->

                        if(num_p >= 1)
                           point_change = num_p;

                           if(followgridoned_row < oldgridoned_rowmax)
                                one_dimention([(followgridoned_row + 1):(onedim_rowmax)],1) = ...
                                    one_dimention([(followgridoned_row + 1):(onedim_rowmax)],1) ...
                                        + point_change;
                           end

                        end

                        %Action XXXI <-

                        %Action XXVII ->

                    end

                    %Action XXVII <-

                     %Progress Bar Advancement Middle Code Interrupt ->

                      if(progress_demand == 1)
                            segsta_pre = valpre_start + [(seg_val*[0.5 + (proggpb_secflag == 1)*0.5 ... 
                              ])/precent100_pro]*100;

                            if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                lastp_print(1,1) = segsta_pre;

                                if(ishandle(handles.protex) == 1)
                                    try
                                        set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                        patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                    end
                                
                                    if(ishandle(handles.protex) == 1)
                                        drawnow;
                                    else
                                        try
                                            clf  (handles.prowin);
                                            delete (handles.prowin);
                                        end
                                    end
                                end
                            end

                            if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                lastp_print(1,2) = segsta_pre;

                                if(gcf == handles.prowin)
                                        try
                                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                            drawnow;
                                        end
                                end
                            end
                     end  

                    %Progress Bar Advancement Middle Code Interrupt <-

                    %Action XXXXXII ->

                    if(followgridoned_row < gridonedim_rowmax)
                       mosaicgrid_create([(mosaicgc_rowmax + 1):(mosaicgc_rowmax + [gridonedim_rowmax - (followgridoned_row ...
                                + 2)] + 1)],1) = gridone_dimention([(followgridoned_row + 2):(gridonedim_rowmax)],1);
                    end

                    %Action XXXXXII <-

                    %Action IIXXX ->

                    gridone_dimention = mosaicgrid_create;
                    gridonedim_rowmax = size(gridone_dimention,1);
                    mosaicgrid_create = 0;

                    %Action IIXXX <-

                    %Action IIXX ->

                else

                    %Action IIXX <-

                    %Action II ->

                    numnew_gridpoints = mosaiconed_gp - gridonedim_rowmax;

                    if(gridonedim_rowmax ~= 1)
                        gridpoints_odiminf = 1/(gridonedim_rowmax - 1);
                    end

                    if(modt(numnew_gridpoints,2) == 0)
                        towardsminus_gp = double(floor(numnew_gridpoints/2));
                        towardsplus_gp = towardsminus_gp;
                    else
                        towardsminus_gp = double(floor(numnew_gridpoints/2));
                        towardsplus_gp = towardsminus_gp + 1;
                    end

                    %Action II <-

                    %Action IV ->

                    if(gridonedim_rowmax == 1)

                       %Action IV <-

                        %Action XV ->

                        if(gridseconddim_rowmax == 1)
                            gridpoints_odimincrement = 1;
                        else
                            gridpoints_sdiminf = 1/(gridseconddim_rowmax - 1);
                            followgridsecondd_row = 2;

                            while(followgridsecondd_row <= gridseconddim_rowmax)
                                gridpoints_sdimincrement = gridpoints_sdimincrement +  ...
                                (gridsecond_dimention(followgridsecondd_row,1) -  ...
                                 gridsecond_dimention([followgridsecondd_row - 1],1))*gridpoints_sdiminf;
                             followgridsecondd_row = followgridsecondd_row + 1;

                             %Progress Bar Advancement Middle Code Interrupt ->

                                if(progress_demand == 1)
                                segsta_pre = valpre_start + [(seg_val*[(followgridsecondd_row/[gridseconddim_rowmax + 1])*0.25 + ... 
                                    (proggpb_secflag == 1)*0.5])/precent100_pro]*100;

                                    if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                        lastp_print(1,1) = segsta_pre;

                                        if(ishandle(handles.protex) == 1)
                                            try
                                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                            end
                                
                                            if(ishandle(handles.protex) == 1)
                                                drawnow;
                                            else
                                                try
                                                    clf  (handles.prowin);
                                                    delete (handles.prowin);
                                                end
                                            end
                                        end
                                end

                                    if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                        lastp_print(1,2) = segsta_pre;

                                        if(gcf == handles.prowin)
                                            try
                                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                                drawnow;
                                            end
                                        end
                                    end
                                end  

                                %Progress Bar Advancement Middle Code Interrupt <-

                            end

                            gridpoints_odimincrement = gridpoints_sdimincrement;
                        end

                        %Action XV <-

                       %Action IV ->

                    else

                        followgridoned_row = 2;

                        while(followgridoned_row <= gridonedim_rowmax)
                            gridpoints_odimincrement = gridpoints_odimincrement + (gridone_dimention(followgridoned_row,1) ...
                               - gridone_dimention([followgridoned_row - 1],1))*gridpoints_odiminf;
                          followgridoned_row = followgridoned_row + 1;

                          %Progress Bar Advancement Middle Code Interrupt ->

                            if(progress_demand == 1)
                             segsta_pre = valpre_start + [(seg_val*[(followgridoned_row/[gridonedim_rowmax + 1])*0.25 +  ... 
                                (proggpb_secflag == 1)*0.5])/precent100_pro]*100;

                                if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                    lastp_print(1,1) = segsta_pre;

                                    if(ishandle(handles.protex) == 1)
                                            try
                                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                            end
                                
                                            if(ishandle(handles.protex) == 1)
                                                drawnow;
                                            else
                                                try
                                                    clf  (handles.prowin);
                                                    delete (handles.prowin);
                                                end
                                            end
                                    end
                                end

                                if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                    lastp_print(1,2) = segsta_pre;

                                    if(gcf == handles.prowin)
                                        try
                                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                            drawnow;
                                        end
                                    end
                                end
                            end  

                            %Progress Bar Advancement Middle Code Interrupt <-

                        end
                    end

                    %Action IV <-

                    %Action V ->

                    mosaic_grid = 0;
                    mosaic_grid([(towardsminus_gp + 1):(gridonedim_rowmax + towardsminus_gp)],1) = ...
                            gridone_dimention([1:gridonedim_rowmax],1);

                    %Action V <-

                    %Action VI ->

                    if(towardsminus_gp ~= 0)
                        followtminus_gp = 1;

                        while(followtminus_gp <= towardsminus_gp)
                            mosaicgrid_point = mosaic_grid([towardsminus_gp + 1],1) - (towardsminus_gp - followtminus_gp ...
                                    + 1)*gridpoints_odimincrement;
                            mosaic_grid(followtminus_gp,1) = mosaicgrid_point;
                            followtminus_gp = followtminus_gp + 1;
                        end
                    end

                    followtplus_gp = 1;

                    while(followtplus_gp <= towardsplus_gp)
                       mosaicgrid_point = mosaic_grid([towardsminus_gp + gridonedim_rowmax],1) + ...
                           (followtplus_gp*gridpoints_odimincrement);
                        mosaic_grid([gridonedim_rowmax + towardsminus_gp + followtplus_gp],1) = mosaicgrid_point;
                        followtplus_gp = followtplus_gp + 1;
                    end

                    %Action VI <-

                    %Progress Bar Advancement Middle Code Interrupt ->

                    if(progress_demand == 1)
                       segsta_pre = valpre_start + [(seg_val*[0.5 + (proggpb_secflag == 1)*0.5 ... 
                              ])/precent100_pro]*100;

                        if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;

                            if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                            end
                        end

                        if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                            lastp_print(1,2) = segsta_pre;

                            if(gcf == handles.prowin)
                                try
                                    set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                    drawnow;
                                end
                            end
                        end
                    end  

                    %Progress Bar Advancement Middle Code Interrupt <-

                    %Action VII ->

                    gridone_dimention = mosaic_grid;
                    gridonedim_rowmax = size(gridone_dimention,1);

                    %Action VII <-

                    %Action IIXV ->

                    followoned_row = 1;

                    while(followoned_row <= onedim_rowmax)
                        one_dimention(followoned_row,1) = one_dimention(followoned_row,1) + towardsminus_gp;
                        followoned_row = followoned_row + 1;
                    end

                    mosaic_grid = 0;

                    %Action IIXV <-

                    %Action IIXX ->

                end

                %Action IIXX <-

                %Action I <-

                end

                %Action I ->

              %Action XXXXXI ->

           end

           %Action XXXXXI <-

            %Action III ->

            if(gridseconddim_rowmax < mosaicsecd_gp)

            %Action III <-

              %Progress Bar Advancement Beginnings Code Interrupt ->

              proggpb_secflag = 1;

              %Progress Bar Advancement Beginnings Code Interrupt <-

            %Action IIXXXV ->

            if(size(mosaicsecd_gpboun,2) == 2)

                %Action IIXXXV <-

                %Action XXXXVII ->

                gridpoints_sdimincrement = 0;

                if(gridseconddim_rowmax == 1)
                    gridpoints_sdimincrement = [gridsecond_dimention(1,1) - mosaicsecd_gpboun(1,1)] + ...
                        [mosaicsecd_gpboun(1,2) - gridsecond_dimention(1,1)];
                else
                    followgridsecondd_row = 2;

                    while(followgridsecondd_row <= gridseconddim_rowmax)
                        gridpoints_sdimincrement = gridpoints_sdimincrement + [gridsecond_dimention(followgridsecondd_row,1) ...
                            - gridsecond_dimention([followgridsecondd_row - 1],1)];
                        followgridsecondd_row = followgridsecondd_row + 1;
                    end
                end

                %Action XXXXVII <-

                %Action IXXXV ->

                nump_sum = 0;

                if(gridseconddim_rowmax == 1)
                    secondsumdef_grid = gridpoints_sdimincrement;
                else
                    secondsumdef_grid = [gridpoints_sdimincrement] + [mosaicsecd_gpboun(1,2) - ...
                        gridsecond_dimention(gridseconddim_rowmax,1)] + [gridsecond_dimention(1,1) - mosaicsecd_gpboun(1,1)];
                end

                numplus_gridpoints = [mosaicsecd_gp - gridseconddim_rowmax];
                gridpoints_sdimincrement = 0;
                numleft_gridpoints = numplus_gridpoints - 1;

                %Action IXXXV <-

                %Action XXXV ->

                if([gridsecond_dimention(1,1) < mosaicsecd_gpboun(1,1)] | ...
                        [gridsecond_dimention(gridseconddim_rowmax,1) > mosaicsecd_gpboun(1,2)])
                    error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Mosaic Grid  Points Boundry: Vector of the second dimension\n' ...
                                    'have data located outside the boundry zone.']));
                end

                %Action XXXV <-

                %Action XXXVI ->

                if(gridsecond_dimention(1,1) == mosaicsecd_gpboun(1,1))

                    %Action XXXVI <-

                    %Action XXXXI ->

                    numleft_gridpoints = numplus_gridpoints;
                    mosaicgrid_create = 0;
                    mosaicgrid_create(1,1) = gridsecond_dimention(1,1);
                    mosaicgc_rowmax = 1;

                    %Action XXXXI <-

                    %Action XXXVI ->

                else

                    %Action XXXVI <-

                    %Action XXXVII ->

                    num_p = [(gridsecond_dimention(1,1) - mosaicsecd_gpboun(1,1))/secondsumdef_grid]*numplus_gridpoints;

                    if(num_p >= 1)
                        nump_reminder = modt(num_p*10,10);
                        num_p = floor(num_p);
                        nump_sum = nump_sum + nump_reminder;

                        if(nump_sum >= 1)
                            numpsum_reminder = modt(nump_sum*10,10);
                            num_p = num_p + floor(nump_sum);
                            nump_sum = numpsum_reminder;
                        end

                    else 
                        nump_sum = nump_sum + num_p;

                        if(nump_sum >= 1) 
                            num_p = floor(nump_sum);
                            numpsum_reminder = modt(nump_sum*10,10);
                            nump_sum = numpsum_reminder;
                        else
                            num_p = 0;
                        end

                    end

                    if(num_p > numleft_gridpoints)
                        num_p = numleft_gridpoints;
                    end

                    if(num_p >= 1)
                        vec_bp = linspace(mosaicsecd_gpboun(1,1),gridsecond_dimention(1,1),[num_p + 2]);
                        vec_bp = vec_bp';
                    else
                        vec_bp = gridsecond_dimention(1,1);
                        vec_bp = vec_bp';
                    end

                    %Action XXXVII <-

                    %Action IIXXXX ->

                    mosaicgrid_create = 0;

                    if(num_p >= 1)
                        mosaicgrid_create([1:(num_p + 2)],1) = vec_bp;
                        mosaicgc_rowmax = num_p + 2;
                        numleft_gridpoints = numleft_gridpoints - num_p;
                    else
                        mosaicgrid_create(1,1) = vec_bp;
                        mosaicgc_rowmax = mosaicgc_rowmax + 1;
                    end

                    %Action IIXXXX <-

                    %Action IXXXX ->

                    if(num_p >= 1)
                        point_change = num_p + 1;
                        second_dimention(1:seconddim_rowmax,1) = second_dimention(1:seconddim_rowmax,1) + point_change;
                    end

                    %Action IXXXX <-

                    %Action XXXVI ->

                end

                %Action XXXVI <-

                %Action XXXX ->

                pointco_flag = 0;
                followgridsecondd_row = 0;
                oldgridsecd_rowmax = gridseconddim_rowmax;

                if(numleft_gridpoints > 0)
                            if(gridsecond_dimention(gridseconddim_rowmax,1) ~= mosaicsecd_gpboun(1,2))
                                pointco_flag = 1;
                                gridseconddim_rowmax = gridseconddim_rowmax + 1;
                                numleft_gridpoints = numleft_gridpoints - 1;
                                gridsecond_dimention(gridseconddim_rowmax,1) = mosaicsecd_gpboun(1,2);
                        end
                end

                %Action XXXX <-

                %Action XXXXII ->

                while([followgridsecondd_row < (gridseconddim_rowmax - 1)] & [numleft_gridpoints > 0])
                    followgridsecondd_row = followgridsecondd_row + 1;

                    %Action XXXXII <-

                    %Progress Bar Advancement Middle Code Interrupt ->

                    if(progress_demand == 1)
                        segsta_pre = valpre_start + [(seg_val*[(followgridsecondd_row/[gridseconddim_rowmax - 1])*0.5 +  ... 
                        (proggpb_oneflag == 1)*0.5])/precent100_pro]*100;

                        if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                            lastp_print(1,1) = segsta_pre;
                            
                            if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                            end
                        end

                        if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                            lastp_print(1,2) = segsta_pre;

                            if(gcf == handles.prowin)
                                try
                                    set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                    drawnow;
                                end
                            end
                        end
                    end  

                    %Progress Bar Advancement Middle Code Interrupt <-

                    %Action IXXXXV ->

                    num_p = [(gridsecond_dimention([followgridsecondd_row + 1],1) - ...
                        gridsecond_dimention(followgridsecondd_row,1))/secondsumdef_grid]*numplus_gridpoints;

                    if(num_p >= 1)
                        nump_reminder = modt(num_p*10,10);
                        num_p = floor(num_p);
                        nump_sum = nump_sum + nump_reminder;

                        if(nump_sum >= 1)
                            numpsum_reminder = modt(nump_sum*10,10);
                            num_p = num_p + floor(nump_sum);
                            nump_sum = numpsum_reminder;
                        end

                    else 
                        nump_sum = nump_sum + num_p;

                        if(nump_sum >= 1) 
                            num_p = floor(nump_sum);
                            numpsum_reminder = modt(nump_sum*10,10);
                            nump_sum = numpsum_reminder;
                        else
                            num_p = 0;
                        end

                    end

                    if([num_p > numleft_gridpoints] | [(followgridsecondd_row - 1) ==  ...
                            gridseconddim_rowmax])
                        num_p = numleft_gridpoints;
                    end

                    if(num_p >= 1)
                        vec_bp = linspace(gridsecond_dimention(followgridsecondd_row,1), ...
                            gridsecond_dimention([followgridsecondd_row + 1],1),[num_p + 2]);
                        vec_bp = vec_bp';
                    else
                        vec_bp = gridsecond_dimention([followgridsecondd_row + 1],1);
                        vec_bp = vec_bp';
                    end


                    %Action IXXXXV <-

                    %Action XXXXV->

                    if(num_p >= 1)
                        mosaicgrid_create([(mosaicgc_rowmax + 1):(mosaicgc_rowmax + 1 + num_p)],1) = vec_bp([2:(num_p + 2)],1);
                        mosaicgc_rowmax = mosaicgc_rowmax + 1 + num_p;
                        numleft_gridpoints = numleft_gridpoints - num_p;
                    else
                        mosaicgrid_create(mosaicgc_rowmax + 1,1) = vec_bp;
                        mosaicgc_rowmax = mosaicgc_rowmax + 1;
                    end

                    %Action XXXXV <-

                    %Action XXXXVI ->

                    if(num_p >= 1)

                       if(followgridsecondd_row < oldgridsecd_rowmax)
                            point_change = num_p;

                            second_dimention([(followgridsecondd_row + 1):(seconddim_rowmax)],1) = ...
                                second_dimention([(followgridsecondd_row + 1):(seconddim_rowmax)],1) ...
                                    + point_change;
                       end

                    end

                    %Action  XXXXVI <-

                    %Action XXXXII ->

                end

                %Action XXXXII <-

                 %Progress Bar Advancement Middle Code Interrupt ->

                if(progress_demand == 1)
                    segsta_pre = valpre_start + [(seg_val*[0.5 + (proggpb_oneflag == 1)*0.5 ... 
                         ])/precent100_pro]*100;

                    if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                        lastp_print(1,1) = segsta_pre;

                        if(ishandle(handles.protex) == 1)
                            try
                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                            end
                                
                            if(ishandle(handles.protex) == 1)
                                drawnow;
                            else
                                try
                                     clf  (handles.prowin);
                                     delete (handles.prowin);
                                end
                            end
                        end
                    end

                    if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                            lastp_print(1,2) = segsta_pre;

                            if(gcf == handles.prowin)
                                try
                                    set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                    drawnow;
                                end
                            end
                    end
                end  

                %Progress Bar Advancement Middle Code Interrupt <-

                 %Action IIXXXXXV ->

                 if(followgridsecondd_row < gridseconddim_rowmax)
                    mosaicgrid_create([(mosaicgc_rowmax + 1):(mosaicgc_rowmax + [gridseconddim_rowmax - ...
                             (followgridsecondd_row + 2)] + 1)],1) = gridsecond_dimention([(followgridsecondd_row + 2): ...
                              (gridseconddim_rowmax)],1);
                 end

                 %Action IIXXXXXV <-

                %Action IIXXXXV ->

                gridsecond_dimention = mosaicgrid_create;
                gridseconddim_rowmax = size(gridsecond_dimention,1);
                 mosaicgrid_create = 0;

                %Action IIXXXXV <-

                    %Action IIXXXV ->

            else

                %Action IIXXXV <-

                %Action IIX ->

                numnew_gridpoints = mosaicsecd_gp - gridseconddim_rowmax;

                if(gridseconddim_rowmax ~= 1)
                    gridpoints_sdiminf = 1/(gridseconddim_rowmax - 1);
                end

                if(modt(numnew_gridpoints,2) == 0)
                    towardsminus_gp = double(floor(numnew_gridpoints/2));
                    towardsplus_gp = towardsminus_gp;
                else
                    towardsminus_gp = double(floor(numnew_gridpoints/2));
                    towardsplus_gp = towardsminus_gp + 1;
                end

                %Action IIX <-

                %Action IX ->

                if(gridseconddim_rowmax == 1)

                    %Action IX <-

                    %Action XVII ->

                    if(gridonedim_rowmax == 1)
                        gridpoints_sdimincrement = 1;
                    else

                        if(gridpoints_odimincrement == 0)
                            gridpoints_odiminf = 1/(gridonedim_rowmax - 1);
                            followgridoned_row = 2;

                            while(followgridoned_row <= gridonedim_rowmax)
                            gridpoints_odimincrement = gridpoints_odimincrement + (gridone_dimention(followgridoned_row,1) ...
                                - gridone_dimention([followgridoned_row - 1],1))*gridpoints_odiminf;
                             followgridoned_row = followgridoned_row + 1;

                             %Progress Bar Advancement Middle Code Interrupt ->

                                if(progress_demand == 1)
                                segsta_pre = valpre_start + [(seg_val*[(followgridoned_row/[gridonedim_rowmax + 1]) +  ... 
                                    (proggpb_oneflag == 1)*0.5])/precent100_pro]*100;

                                    if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                        lastp_print(1,1) = segsta_pre;

                                        if(ishandle(handles.protex) == 1)
                                                try
                                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                                end
                                
                                                if(ishandle(handles.protex) == 1)
                                                    drawnow;
                                                else
                                                   try
                                                        clf  (handles.prowin);
                                                        delete (handles.prowin);
                                                    end
                                                end
                                        end
                                    end

                                    if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                        lastp_print(1,2) = segsta_pre;

                                        if(gcf == handles.prowin)
                                            try
                                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                                drawnow;
                                            end
                                        end
                                    end
                                end  

                                %Progress Bar Advancement Middle Code Interrupt <-

                            end

                            gridpoints_sdimincrement = gridpoints_odimincrement;
                        else
                            gridpoints_sdimincrement = gridpoints_odimincrement;
                        end
                    end

                    %Action XVII <-

                    %Action IX ->

                else

                    if(gridpoints_sdimincrement == 0) 
                        followgridsecondd_row = 2;

                        while(followgridsecondd_row <= gridseconddim_rowmax)
                            gridpoints_sdimincrement = gridpoints_sdimincrement + ...
                             (gridsecond_dimention(followgridsecondd_row,1) - ...
                            gridsecond_dimention([followgridsecondd_row - 1],1))*gridpoints_sdiminf;
                          followgridsecondd_row = followgridsecondd_row + 1;

                          %Progress Bar Advancement Middle Code Interrupt ->

                            if(progress_demand == 1)
                                segsta_pre = valpre_start + [(seg_val*[(followgridsecondd_row/[gridseconddim_rowmax + 1])*0.25 +  ... 
                                    (proggpb_oneflag == 1)*0.5])/precent100_pro]*100;

                                if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                                    lastp_print(1,1) = segsta_pre;

                                    if(ishandle(handles.protex) == 1)
                                            try
                                                set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                                patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                            end
                                
                                            if(ishandle(handles.protex) == 1)
                                                drawnow;
                                            else
                                               try
                                                    clf  (handles.prowin);
                                                    delete (handles.prowin);
                                                end
                                            end
                                    end
                                end

                                if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                    lastp_print(1,2) = segsta_pre;

                                    if(gcf == handles.prowin)
                                        try
                                            set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                            drawnow;
                                        end
                                    end
                                end
                            end  

                            %Progress Bar Advancement Middle Code Interrupt <-

                        end
                    end             
                    end

                %Action IX <-

                %Action X ->

                mosaic_grid = 0;
                mosaic_grid([(towardsminus_gp + 1):(gridseconddim_rowmax + towardsminus_gp)],1) = ...
                    gridsecond_dimention([1:gridseconddim_rowmax],1);

                %Action X <-

                %Action XI ->

                if(towardsminus_gp ~= 0)
                    followtminus_gp = 1;

                        while(followtminus_gp <= towardsminus_gp)
                        mosaicgrid_point = mosaic_grid([towardsminus_gp + 1],1) - (towardsminus_gp - followtminus_gp + 1)* ...
                        gridpoints_sdimincrement;
                        mosaic_grid(followtminus_gp,1) = mosaicgrid_point;
                        followtminus_gp = followtminus_gp + 1;
                    end
                end

                followtplus_gp = 1;

                while(followtplus_gp <= towardsplus_gp)
                    mosaicgrid_point = mosaic_grid([towardsminus_gp + gridseconddim_rowmax],1) + ...
                            (followtplus_gp*gridpoints_sdimincrement);
                    mosaic_grid([gridseconddim_rowmax + towardsminus_gp + followtplus_gp],1) = mosaicgrid_point;
                    followtplus_gp = followtplus_gp + 1;
                end

                %Action XI <-

                 %Progress Bar Advancement Middle Code Interrupt ->

                if(progress_demand == 1)
                    segsta_pre = valpre_start + [(seg_val*[0.5 + (proggpb_oneflag == 1)*0.5 ... 
                          ])/precent100_pro]*100;

                    if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                        lastp_print(1,1) = segsta_pre;

                        if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                        end
                    end

                    if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                        lastp_print(1,2) = segsta_pre;

                        if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                          end
                        end
                    end
                end  

                %Progress Bar Advancement Middle Code Interrupt <-

                %Action XII ->

                gridsecond_dimention = mosaic_grid;
                gridseconddim_rowmax = size(gridsecond_dimention,1);

                %Action XII <-

                %Action IXV ->

                followsecondd_row = 1;

                while(followsecondd_row <= seconddim_rowmax)
                    second_dimention(followsecondd_row,1) = second_dimention(followsecondd_row,1) + towardsminus_gp;
                    followsecondd_row = followsecondd_row + 1;
                end

                mosaic_grid = 0;

                %Action IXV <-

                %Action IIXXXV ->

            end

            %Action IIXXXV <-

                %Action III ->

            end

            %Action III <-

           %Action XXXXX ->

        end

        %Action XXXXX <-

        %Progress Bar Finishing Code Interrupt ->

        if(progress_demand == 1)
          precent_status = segsta_pre;
        end

        %Progress Bar Finishing Code Interrupt <-

        %Creating Mosaic Grid Points <-

        %Creating Matrices Of 3D Data For A 3D Plot ->

        %Action IV ->

        if(size(repsurf_demand,2) == 1)

                %Action IV <-

                %Progress Bar Advancement Beginnings Code Interrupt ->

                if(progress_demand == 1)
                    valpre_start = precent_status;
                   seg_val = 10;
                end

                %Progress Bar Advancement Beginnings Code Interrupt <-

                %Action I ->

                onedim_3d = gridone_dimention';
                onedim3d_colmax = gridonedim_rowmax;

                %Action I <-

                %Action II ->

                seconddim_3d = gridsecond_dimention;
                seconddim3d_rowmax = gridseconddim_rowmax;

                %Action II <-

                %Action III ->

                followthirdd_row = 1;
                followoned_row = 1;
                followsecondd_row = 1;
                thirddim_3d = 0;
                thirddim_rowmax = size(third_dimention,1);
                thirddim_3d([1:gridseconddim_rowmax],[1:gridonedim_rowmax]) = 0;

                while([followoned_row <= onedim_rowmax] & [followsecondd_row <= seconddim_rowmax] & ...
                      [followthirdd_row <= thirddim_rowmax])

                   thirddim_3d(second_dimention(followsecondd_row,1),one_dimention(followoned_row,1)) = ...
                      third_dimention(followthirdd_row,1);
                   followoned_row = followoned_row + 1;
                   followsecondd_row = followsecondd_row + 1;
                   followthirdd_row = followthirdd_row + 1; 

                   %Progress Bar Advancement Middle Code Interrupt ->

                   if(progress_demand == 1)
                    segsta_pre = valpre_start + [(seg_val*[followthirdd_row / thirddim_rowmax ... 
                         ])/precent100_pro]*100;

                      if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                         lastp_print(1,1) = segsta_pre;

                        if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                        end
                      end

                      if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                         lastp_print(1,2) = segsta_pre;

                         if(gcf == handles.prowin)
                            try
                                set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                drawnow;
                            end
                         end
                      end
                   end  

                   %Progress Bar Advancement Middle Code Interrupt <-

                end

                %Action III <-

                %Progress Bar Finishing Code Interrupt ->

                if(progress_demand == 1)
                  precent_status = segsta_pre;
                end

                %Progress Bar Finishing Code Interrupt <-

                %Action IV ->

        end

        %Action IV <-

        %Creating Matrices Of 3D Data For A 3D Plot <-

        %Creating an Imaginary Mosaic Picture ->

        %Action I ->

        if(mosaicpicture_demand == 1)

           %Action I <-

           %Progress Bar Advancement Beginnings Code Interrupt ->

           if(progress_demand == 1)
            valpre_start = precent_status;
            seg_val = 30;
           end

           %Progress Bar Advancement Beginnings Code Interrupt <-

           %Action II ->

           followthirdd_row = 1;

           if(size(repsurf_demand,2) == 1)
               while(followthirdd_row <= thirddim_rowmax)

                  if(third_dimention(followthirdd_row,1) == 0)
                     thirddim_3d(second_dimention(followthirdd_row,1),one_dimention(followthirdd_row,1)) = 0.00000001;
                  end

                  followthirdd_row = followthirdd_row + 1;
               end
           end

           %Action II <-

           %Action V ->

           [thirddim3d_rowmax,thirddim3d_colmax] = size(thirddim_3d);
           followthird3d_row = 0;
           followthird3d_col = 1;
           mosaic_picture = thirddim_3d;

           %Action V <-

           %Action III ->

           flag_iii_IXV = 0;

           while(flag_iii_IXV == 0)
              flag_iii_a = 0;

              while(flag_iii_a == 0)
                followthird3d_row = followthird3d_row + 1;


                if(followthird3d_row > thirddim3d_rowmax)
                    followthird3d_row = 1;
                    followthird3d_col = followthird3d_col + 1;

                    if(followthird3d_col > thirddim3d_colmax)
                       flag_iii_IXV = 1;
                       flag_iii_a = 1;
                    end
                end

                if(flag_iii_IXV == 0)

                    %Progress Bar Advancement Middle Code Interrupt ->

                    if(progress_demand == 1)
                        segsta_pre = valpre_start + [(seg_val*[([followthird3d_row/thirddim3d_rowmax]*followthird3d_col)/ ...
                            thirddim3d_colmax])/precent100_pro]*100;

                        if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                               lastp_print(1,1) = segsta_pre;
       
                           if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                            end
                        end

                        if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                                lastp_print(1,2) = segsta_pre;

                            if(gcf == handles.prowin)
                                try
                                    set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                    drawnow;
                                end
                            end
                        end
                    end  

                    %Progress Bar Advancement Middle Code Interrupt <-

                    if(thirddim_3d(followthird3d_row,followthird3d_col) == 0)
                       flag_iii_a = 1;
                    end
                 end
              end

              if(flag_iii_IXV == 0)

                 %Action III <-

                 %Action VI ->

                 perimetersquare_type = 0;
                 psquareline1_relevant = 1;
                 psquareline2_relevant = 1;
                 psquareline3_relevant = 1;
                 psquareline4_relevant = 1;
                 patcell_mat = 0;
                 num_patcell = 0;

                 %Action VI <-

                 %Action VII ->

                 flag_vii_IIX = 0;

                 while(flag_vii_IIX == 0)
                    perimetersquare_type = perimetersquare_type + 1;

                    if(num_patcell >= 2)
                       flag_vii_IIX = 1;
                    elseif([psquareline1_relevant ~= 1] & [psquareline2_relevant ~= 1] & ...
                          [psquareline3_relevant ~= 1] & [psquareline4_relevant ~= 1])
                       flag_vii_IIX = 1;
                    end

                    if(flag_vii_IIX == 0);

                       %Action VII <-

                       %Action IX ->

                       if(psquareline1_relevant == 1)
                          psminmaxbound_row = followthird3d_row - perimetersquare_type;
                          psminbound_col = followthird3d_col - perimetersquare_type;
                          psmaxbound_col = followthird3d_col + perimetersquare_type;

                          if(psminmaxbound_row < 1)
                             psquareline1_relevant = 0;
                          else

                             if(psminbound_col < 1)
                                psminbound_col = 1;
                             end

                             if(psmaxbound_col > thirddim3d_colmax)
                                psmaxbound_col = thirddim3d_colmax;
                             end

                             followthird3d_psrow = psminmaxbound_row;
                             followthird3d_pscol = psminbound_col;

                             while(followthird3d_pscol <= psmaxbound_col)

                                if(thirddim_3d(followthird3d_psrow,followthird3d_pscol) ~= 0)
                                   num_patcell = num_patcell + 1;
                                   patcell_mat(num_patcell,1) = followthird3d_psrow;
                                   patcell_mat(num_patcell,2) = followthird3d_pscol;
                                   patcell_mat(num_patcell,3) = perimetersquare_type;
                                   patcell_mat(num_patcell,4) = 1;
                                end

                                followthird3d_pscol = followthird3d_pscol + 1;
                             end
                          end
                       end

                       if(psquareline2_relevant == 1)
                          psminmaxbound_row = followthird3d_row + perimetersquare_type;
                          psminbound_col = followthird3d_col - perimetersquare_type;
                          psmaxbound_col = followthird3d_col + perimetersquare_type;

                          if(psminmaxbound_row > thirddim3d_rowmax)
                             psquareline2_relevant = 0;
                          else

                             if(psminbound_col < 1)
                                psminbound_col = 1;
                             end

                             if(psmaxbound_col > thirddim3d_colmax)
                                psmaxbound_col = thirddim3d_colmax;
                             end

                             followthird3d_psrow = psminmaxbound_row;
                             followthird3d_pscol = psminbound_col;

                             while(followthird3d_pscol <= psmaxbound_col)

                                if(thirddim_3d(followthird3d_psrow,followthird3d_pscol) ~= 0)
                                   num_patcell = num_patcell + 1;
                                   patcell_mat(num_patcell,1) = followthird3d_psrow;
                                   patcell_mat(num_patcell,2) = followthird3d_pscol;
                                   patcell_mat(num_patcell,3) = perimetersquare_type;
                                   patcell_mat(num_patcell,4) = 2;
                                end

                                followthird3d_pscol = followthird3d_pscol + 1;
                             end
                          end
                       end

                       if(psquareline3_relevant == 1)
                          psminmaxbound_col = followthird3d_col - perimetersquare_type;
                          psminbound_row = followthird3d_row - perimetersquare_type + 1;
                          psmaxbound_row = followthird3d_row + perimetersquare_type - 1;

                          if(psminmaxbound_col < 1)
                             psquareline3_relevant = 0;
                          else

                             if(psminbound_row < 1)
                                psminbound_row = 1;
                             end

                             if(psmaxbound_row > thirddim3d_rowmax)
                                psmaxbound_row = thirddim3d_rowmax;
                             end

                             followthird3d_pscol = psminmaxbound_col;
                             followthird3d_psrow = psminbound_row;

                             while(followthird3d_psrow <= psmaxbound_row)

                                if(thirddim_3d(followthird3d_psrow,followthird3d_pscol) ~= 0)
                                   num_patcell = num_patcell + 1;
                                   patcell_mat(num_patcell,1) = followthird3d_psrow;
                                   patcell_mat(num_patcell,2) = followthird3d_pscol;
                                   patcell_mat(num_patcell,3) = perimetersquare_type;
                                   patcell_mat(num_patcell,4) = 3;
                                end

                                followthird3d_psrow = followthird3d_psrow + 1;
                             end
                          end
                       end

                       if(psquareline4_relevant == 1)
                          psminmaxbound_col = followthird3d_col + perimetersquare_type;
                          psminbound_row = followthird3d_row - perimetersquare_type + 1;
                          psmaxbound_row = followthird3d_row + perimetersquare_type - 1;

                          if(psminmaxbound_col > thirddim3d_colmax)
                             psquareline4_relevant = 0;
                          else

                             if(psminbound_row < 1)
                                psminbound_row = 1;
                             end

                             if(psmaxbound_row > thirddim3d_rowmax)
                                psmaxbound_row = thirddim3d_rowmax;
                             end

                             followthird3d_pscol = psminmaxbound_col;
                             followthird3d_psrow = psminbound_row;

                             while(followthird3d_psrow <= psmaxbound_row)

                                if(thirddim_3d(followthird3d_psrow,followthird3d_pscol) ~= 0)
                                   num_patcell = num_patcell + 1;
                                   patcell_mat(num_patcell,1) = followthird3d_psrow;
                                   patcell_mat(num_patcell,2) = followthird3d_pscol;
                                    patcell_mat(num_patcell,3) = perimetersquare_type;
                                   patcell_mat(num_patcell,4) = 4;
                                end

                                followthird3d_psrow = followthird3d_psrow + 1;
                             end
                          end
                       end

                       %Action IX <-

                       %Action VII ->

                    end               
                 end         

                 %Action VII <-

                 %Action IIX ->

                 if(num_patcell == 0)
                    error('MyError:ErrorPrevent',sprintf(['vecsurf Error - Pattern Cell: No pattern cell''s were found in the' ...
                                      '\nperimeter square''s. Contact support for help.']));
                 end

                 %Action IIX <-

                 %Action X ->

                 followpatcell_row = 0;
                 patcell_rowmax = num_patcell;

                 %Action X <-

                 %Action XI ->

                 while(followpatcell_row < patcell_rowmax)
                    followpatcell_row = followpatcell_row + 1;

                    %Action XI <-

                    %Action IIXV ->

                    one_perpendicular = patcell_mat(followpatcell_row,3);

                    if(patcell_mat(followpatcell_row,4) == 1 | patcell_mat(followpatcell_row,4) == 2)

                       if(patcell_mat(followpatcell_row,2) > followthird3d_col)
                          tow_perpendicular = patcell_mat(followpatcell_row,2) - followthird3d_col;
                       else
                          tow_perpendicular = followthird3d_col - patcell_mat(followpatcell_row,2);
                       end
                    else

                       if(patcell_mat(followpatcell_row,1)  > followthird3d_row)
                          tow_perpendicular = patcell_mat(followpatcell_row,1) - followthird3d_row;
                       else
                          tow_perpendicular = followthird3d_row - patcell_mat(followpatcell_row,1);
                       end
                    end

                    tangus_cal = one_perpendicular^2 + tow_perpendicular^2;
                    distance = sqrt(tangus_cal);
                    patcell_mat(followpatcell_row,5) = distance;

                    %Action IIXV <-

                    %Action XI ->

                 end

                 %Action XI <-

                 %Action IIXX ->

                 min_value = patcell_mat(1,5);
                 followpatcell_row = 2;

                 while(followpatcell_row <= patcell_rowmax)

                    if(min_value > patcell_mat(followpatcell_row,5))
                       min_value = patcell_mat(followpatcell_row,5);
                    end

                    followpatcell_row = followpatcell_row + 1;
                 end

                 firstdis_min = min_value;

                 %Action IIXX <-

                 %Action IXX ->

                 newpatcell_mat = 0;
                 follownpatcell_row = 1;
                 followpatcell_row = 1;

                 while(followpatcell_row <= patcell_rowmax)

                    if(patcell_mat(followpatcell_row,5) == firstdis_min)
                       newpatcell_mat(follownpatcell_row,1:5) = patcell_mat(followpatcell_row,1:5);
                       follownpatcell_row = follownpatcell_row + 1;
                    end

                    followpatcell_row = followpatcell_row + 1;
                 end

                 npatcell_rowmax = size(newpatcell_mat,1);

                 %Action IXX <-

                 %Action XX ->

                 if([npatcell_rowmax < 2] & [npatcell_rowmax ~= patcell_rowmax])

                    %Action XX <-

                    %Action XXI ->

                    followpatcell_row = 1;
                    flag_xxi_a = 0;

                    while([followpatcell_row <= patcell_rowmax] & [flag_xxi_a == 0])

                       if(firstdis_min ~= patcell_mat(followpatcell_row,5))
                          flag_xxi_a = 1;
                       else
                          followpatcell_row = followpatcell_row + 1;
                       end
                    end

                    if(followpatcell_row > patcell_rowmax)
                       disp(sprintf(['vecsurf Warning - Minimal Distance For Pattern\n' ...
                                     'Cell Operation: Operation Failed, Could cause worng calculations.\n' ...
                                     'Contact support for help.']));
                    end

                    %Action XXI <-

                    %Action XXII ->

                    min_value = patcell_mat(followpatcell_row,5);

                    while(followpatcell_row < patcell_rowmax)
                       followpatcell_row = followpatcell_row + 1;

                       if([min_value > patcell_mat(followpatcell_row,5)] & ...
                          [patcell_mat(followpatcell_row,5) ~= firstdis_min])
                        min_value = patcell_mat(followpatcell_row,5);
                        end
                    end

                    seconddis_min = min_value;

                    %Action XXII <-

                    %Action IIXXV ->

                    followpatcell_row = 1;

                    while(followpatcell_row <= patcell_rowmax)

                       if(patcell_mat(followpatcell_row,5) == seconddis_min)
                          newpatcell_mat(follownpatcell_row,1:5) = patcell_mat(followpatcell_row,1:5);
                          follownpatcell_row = follownpatcell_row + 1;
                       end

                       followpatcell_row = followpatcell_row + 1;
                    end

                    %Action IIXXV <-

                    %Action XX ->

                 end

                 %Action XX <-

                 %Action IXXV ->

                 patcell_mat = 0;
                 patcell_mat = newpatcell_mat;
                 patcell_rowmax = size(newpatcell_mat,1);

                 %Action IXXV <-

                 %Action XII ->

                 followpatcell_row = 1;
                 x100p_distance = 0;

                 while(followpatcell_row <= patcell_rowmax)
                    x100p_distance = x100p_distance + patcell_mat(followpatcell_row,5);
                    followpatcell_row = followpatcell_row + 1;
                 end

                 if(patcell_rowmax ~= 1)

                    %Action XII <-

                    %Action XVII ->

                    followpatcell_row = 1;
                    value_cal = 0;

                    while(followpatcell_row <= patcell_rowmax)
                        patcell_mat(followpatcell_row,5) = x100p_distance - patcell_mat(followpatcell_row,5);
                        value_cal = value_cal + patcell_mat(followpatcell_row,5);
                        followpatcell_row = followpatcell_row + 1;
                    end

                    x100p_distance = value_cal;

                    %Action XVII <-

                    %Action XII ->

                 end

                 %Action XII <-

                 %Action IXV ->

                 followpatcell_row = 1;

                 while(followpatcell_row <= patcell_rowmax)
                    patcell_mat(followpatcell_row,6) = patcell_mat(followpatcell_row,5)/x100p_distance;
                    followpatcell_row = followpatcell_row + 1;
                 end

                 %Action IXV <-

                 %Action XV ->

                 mosaic_stone = 0;
                 followpatcell_row = 1;

                 while(followpatcell_row <= patcell_rowmax)
                    mosaic_stone = patcell_mat(followpatcell_row,6)*thirddim_3d(patcell_mat(followpatcell_row,1) ...
                                       ,patcell_mat(followpatcell_row,2)) + mosaic_stone;
                    followpatcell_row = followpatcell_row + 1;
                 end

                 mosaic_picture(followthird3d_row,followthird3d_col) = mosaic_stone;

                 %Action XV <-

                 %Action III ->

              end
           end

           %Action III <-

           %Action XVI ->

           thirddim_3d = mosaic_picture;
           mosaic_picture = 0;

           %Action XVI <-

           %Action IV ->

           followthirdd_row = 1;

           if(size(repsurf_demand,2) == 1)
               while(followthirdd_row <= thirddim_rowmax)

                  if(third_dimention(followthirdd_row,1) == 0)
                     thirddim_3d(second_dimention(followthirdd_row,1),one_dimention(followthirdd_row,1)) = 0;
                  end

                  followthirdd_row = followthirdd_row + 1;
               end
           end

           %Action IV <-

           %Progress Bar Finishing Code Interrupt ->

            if(progress_demand == 1)
                precent_status = segsta_pre;
            end

           %Progress Bar Finishing Code Interrupt <-

           %Action I ->

        end

        %Action I <-

        %Creating an Imaginary Mosaic Picture <-

        %Modifying The Three Dimensional Surface Under the Smooth Algoritem ->

        %Action I ->

        if(size(smooth,2) == 3)

            %Action I <-

            %Progress Bar Advancement Beginnings Code Interrupt ->

           if(progress_demand == 1)
                valpre_start = precent_status;
                seg_val = 15;
           end

           %Progress Bar Advancement Beginnings Code Interrupt <-

            %Action XXV ->

            if(smooth(1,1) > size(thirddim_3d,1))
                smooth(1,1) = size(thirddim_3d,1);
            end

            if(smooth(1,2) > size(thirddim_3d,2))
                smooth(1,2) = size(thirddim_3d,2);
            end

            %Action XXV <-

            %Action II ->

            thirddim3d_pass{1,1} = [1,1,size(thirddim_3d,1) - (smooth(1,1) - 1); ...
                                    1,1,size(thirddim_3d,2) - (smooth(1,2) - 1); ...
                                    1,smooth(1,1) - 1,0; ...
                                    1,smooth(1,2) - 1,0];

            thirddim3d_pass{2,1} = [size(thirddim_3d,1),-1,smooth(1,1); ...
                                    size(thirddim_3d,2),-1,smooth(1,2); ...
                                    -1,-smooth(1,1) + 1,0; ...
                                    -1,-smooth(1,2) + 1,0];

            thirddim3d_passtype = [1,1; ...
                                   2,1; ...
                                   1,2;
                                   2,2];

          surfacesmooth_times = 0;

          %Action II <-

          %Action XVI ->

          thirddim3d_edgepass{1,1} = [1,1,size(thirddim_3d,1); ...
                                      size(thirddim_3d,2),0,size(thirddim_3d,2); ...
                                      0,-1,0; ...
                                      0,-2,0];

          thirddim3d_edgepass{2,1} = [size(thirddim_3d,1),0,size(thirddim_3d,1); ...
                                      1,1,size(thirddim_3d,2); ...
                                     -1,0,0; ...
                                     -2,0,0];

          thirddim3d_edgepass{3,1} = [1,1,size(thirddim_3d,1); ...
                                      1,0,1; ...
                                      0,1,0; ...
                                      0,2,0];

          thirddim3d_edgepass{4,1} = [1,0,1; ...
                                      1,1,size(thirddim_3d,2); ...
                                      1,0,0; ...
                                      2,0,0];


          %Action XVI <-

          %Progress Bar Advancement Special 1 Code Interrupt -> 

          if(progress_demand == 1)
            progress_counter = 0;
            progressc_100p = [thirddim3d_pass{1,1}(1,3)*thirddim3d_pass{1,1}(2,3)]*4* ...
                              smooth(1,3);
          end

          %Progress Bar Advancement Special 1 Code Interrupt <-

          %Action IXV ->

          while(surfacesmooth_times < smooth(1,3))

              %Action IXV <-

              %Action III ->

              thirddim3d_numpass = 1;
              spesquare_numpoints = smooth(1,1)*smooth(1,2);

              %Action III <-

              %Action IV ->

              while(thirddim3d_numpass <= 4)

                  %Action IV <-

                  %Action VI ->

                  followthird3d_row = thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(1,1);
                  followthird3d_col = thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(2,1);
                  gensquare_passswitch = 1;

                  %Action VI <-

                  %Action VII ->

                  while(gensquare_passswitch == 1)

                      %Action VII <-

                      %Progress Bar Advancement Special 2  Code Interrupt -> 

                      if(progress_demand == 1)
                        progress_counter = progress_counter + 1;
                      end

                      %Progress Bar Advancement Special  2 Code Interrupt <- 

                      %Progress Bar Advancement Middle Code Interrupt ->

                       if(progress_demand == 1)
                        segsta_pre = valpre_start + [(seg_val*[progress_counter/progressc_100p ... 
                             ])/precent100_pro]*100;

                          if((segsta_pre - lastp_print(1,1)) > minp_p(1,1))
                             lastp_print(1,1) = segsta_pre;
                            
                            if(ishandle(handles.protex) == 1)
                                try
                                    set(0,'CurrentFigure',handles.prowin);(handles.prowin)
                                    patch([1,segsta_pre,segsta_pre,1],[1,1,2,2],'r');
                                end
                                
                                if(ishandle(handles.protex) == 1)
                                    drawnow;
                                else
                                    try
                                        clf  (handles.prowin);
                                        delete (handles.prowin);
                                    end
                                end
                            end
                          end

                          if((segsta_pre - lastp_print(1,2)) > minp_p(1,2))
                             lastp_print(1,2) = segsta_pre;

                             if(gcf == handles.prowin)
                                try
                                    set(handles.protex,'string',sprintf('%.0f',segsta_pre));
                                    drawnow;
                                end
                             end
                          end
                       end  

                       %Progress Bar Advancement Middle Code Interrupt <-

                      %Action IX ->

                      followthird3dspe_row = followthird3d_row;
                      followthird3dspe_col = followthird3d_col;
                      spesquare_numpass = 1;
                      squarepoints_sum = 0;

                      %Action IX <-

                      %Action X ->

                      while(spesquare_numpass <= 2)

                          %Action X <-

                          %Action XII ->

                          if(spesquare_numpass == 1)
                              squarepoints_sum = squarepoints_sum + thirddim_3d(followthird3dspe_row,followthird3dspe_col);
                          else
                              thirddim_3d(followthird3dspe_row,followthird3dspe_col) = squarepoints_sumavg;
                          end

                          %Action XII <-

                          %Action IIXV ->

                          flagiixv_IIXXV = 0;

                          if(thirddim3d_passtype(thirddim3d_numpass,2) == 1)

                              if(followthird3dspe_col == [followthird3d_col + thirddim3d_pass{[thirddim3d_passtype([ ...
                                                        thirddim3d_numpass],1)],1}(4,2)])

                                    followthird3dspe_col = followthird3d_col;

                                    if(followthird3dspe_row == [followthird3d_row + thirddim3d_pass{[thirddim3d_passtype([ ...
                                                                thirddim3d_numpass],1)],1}(3,2)])

                                        spesquare_numpass = spesquare_numpass + 1;

                                        if(spesquare_numpass == 2)
                                            followthird3dspe_row = followthird3d_row;
                                            followthird3dspe_col = followthird3d_col;
                                            flagiixv_IIXXV = 1;
                                        end
                                    else
                                       followthird3dspe_row =  followthird3dspe_row + thirddim3d_pass{[ ...
                                                               thirddim3d_passtype(thirddim3d_numpass,1)],1}(3,1);

                                    end
                              else
                                  followthird3dspe_col = followthird3dspe_col + thirddim3d_pass{[ ...
                                                         thirddim3d_passtype(thirddim3d_numpass,1)],1}(4,1);
                              end

                          else

                              if(followthird3dspe_row == [followthird3d_row + thirddim3d_pass{[ ...
                                                          thirddim3d_passtype(thirddim3d_numpass,1)],1}(3,2)])
                                    followthird3dspe_row = followthird3d_row;

                                    if(followthird3dspe_col == [followthird3d_col + thirddim3d_pass{[ ...
                                                                thirddim3d_passtype(thirddim3d_numpass,1)],1}(4,2)])

                                        spesquare_numpass = spesquare_numpass + 1;

                                        if(spesquare_numpass == 2)
                                            followthird3dspe_row = followthird3d_row;
                                            followthird3dspe_col = followthird3d_col;
                                            flagiixv_IIXXV = 1;   
                                        end
                                    else
                                        followthird3dspe_col = followthird3dspe_col + thirddim3d_pass{[ ...
                                                               thirddim3d_passtype(thirddim3d_numpass,1)],1}(4,1);
                                    end
                              else
                                  followthird3dspe_row = followthird3dspe_row + thirddim3d_pass{[ ...
                                                         thirddim3d_passtype(thirddim3d_numpass,1)],1}(3,1);
                              end
                          end

                          if(flagiixv_IIXXV == 1)

                              %Action IIXV <-

                              %Action IIXXV ->

                              squarepoints_sumavg = squarepoints_sum/spesquare_numpoints;

                              %Action  IIXXV <-

                              %Action IIXV ->

                          end

                          %Action IIXV <-

                          %Action X ->

                      end

                      %Action X <-

                      %Action XI ->

                      if(thirddim3d_passtype(thirddim3d_numpass,2) == 1)

                          if(followthird3d_col == thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(2,3))
                              followthird3d_col = thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(2,1);;

                              if(followthird3d_row == thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(1,3))
                                  gensquare_passswitch = 0;
                              else
                                  followthird3d_row = followthird3d_row + thirddim3d_pass{[ ...
                                                      thirddim3d_passtype(thirddim3d_numpass,1)],1}(1,2);
                              end
                          else
                              followthird3d_col = followthird3d_col + thirddim3d_pass{[ ...
                                                  thirddim3d_passtype(thirddim3d_numpass,1)],1}(2,2);
                          end
                      else

                          if(followthird3d_row == thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(1,3))
                              followthird3d_row = thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(1,1);

                              if(followthird3d_col == thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(2,3))
                                  gensquare_passswitch = 0;
                              else
                                  followthird3d_col = followthird3d_col + thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(2,2);
                              end
                          else
                              followthird3d_row = followthird3d_row + thirddim3d_pass{thirddim3d_passtype(thirddim3d_numpass,1),1}(1,2);
                          end
                      end

                      %Action XI <-

                      %Action VII ->

                  end

                  %Action VII <-

                  %Action IIX ->

                  thirddim3d_numpass = thirddim3d_numpass + 1;

                  %Action IIX <-

                  %Action IV ->

              end

              %Action IV <-

              %Action V ->

              thirddim3d_numpass = 1;

              %Action V <-

              %Action XVII ->

              while(thirddim3d_numpass <= 4)

                  %Action XVII <-

                  %Action IXX ->

                  followthird3d_row = thirddim3d_edgepass{thirddim3d_numpass,1}(1,1);
                  followthird3d_col = thirddim3d_edgepass{thirddim3d_numpass,1}(2,1);

                  if([(followthird3d_row + thirddim3d_edgepass{thirddim3d_numpass,1}(4,1)) <= thirddim3d_rowmax] & ...
                     [(followthird3d_col + thirddim3d_edgepass{thirddim3d_numpass,1}(4,2)) <= thirddim3d_colmax] & ...
                     [(followthird3d_row + thirddim3d_edgepass{thirddim3d_numpass,1}(4,1)) >= 1] & ...
                     [(followthird3d_col + thirddim3d_edgepass{thirddim3d_numpass,1}(4,2)) >= 1])
                        edgepass_switch = 1;
                  else
                      edgepass_switch = 0;
                  end

                  %Action IXX <-

                  %Action XX ->

                  while(edgepass_switch == 1)

                      %Action XX <-

                      %Action XXII ->

                      thirddim_3d(followthird3d_row,followthird3d_col) = thirddim_3d(followthird3d_row,followthird3d_col) + ...
                            [thirddim_3d([followthird3d_row + thirddim3d_edgepass{thirddim3d_numpass,1}(3,1)],[followthird3d_col + ...
                            thirddim3d_edgepass{thirddim3d_numpass,1}(3,2)]) - thirddim_3d([followthird3d_row + ...
                            thirddim3d_edgepass{thirddim3d_numpass,1}(4,1)],[followthird3d_col + ...
                            thirddim3d_edgepass{thirddim3d_numpass,1}(4,2)])];

                      %Action XXII <-

                      %Action IXXV ->

                      followthird3d_row = followthird3d_row + thirddim3d_edgepass{thirddim3d_numpass,1}(1,2);
                      followthird3d_col = followthird3d_col + thirddim3d_edgepass{thirddim3d_numpass,1}(2,2);

                      if(followthird3d_row > thirddim3d_edgepass{thirddim3d_numpass,1}(1,3))
                          edgepass_switch = 0;
                      end

                      if(followthird3d_col > thirddim3d_edgepass{thirddim3d_numpass,1}(2,3))
                          edgepass_switch = 0;
                      end

                      %Action IXXV <-

                      %Action XX ->

                  end

                  %Action XX <-

                  %Action XXI ->

                  thirddim3d_numpass = thirddim3d_numpass + 1;

                  %Action XXI <-

                  %Action XVII ->

              end

              %Action XVII <-

              %Action IIXX ->

              surfacesmooth_times = surfacesmooth_times + 1;

              %Action IIXX <-

              %Action IXV ->

            end

            %Action IXV <-

            %Progress Bar Finishing Code Interrupt ->

            if(progress_demand == 1)
                precent_status = segsta_pre;
            end

            %Progress Bar Finishing Code Interrupt <-

            %Action I ->

        end

        %Action I <-

        %Modifying The Three Dimensional Surface Under the Smooth Algoritem <-

        %Progress Bar Delete Code Interrupt ->
       
        if(progress_demand == 1)

           if(ishandle(handles.protex) == 1)
              try
                hold off;
                set(handles.protex,'string','100');
                set(handles.comtex,'visible','on');
                axis off;
                plot(0,0);
                axis off;
                drawnow;
                pause(1);
              end
           end
        end
        
        try
            clf (handles.prowin)
        end
        
        try
            delete(handles.prowin);      
        end
        
        %Progress Bar Delete Code Interrupt <-

        %Returning Values ->

        switch plot_demand
            case {1}
                figure
              surf(onedim_3d,seconddim_3d,thirddim_3d);
           case {2}
               figure
              mesh(onedim_3d,seconddim_3d,thirddim_3d);
           otherwise
              varargout{1,1} = onedim_3d;
              varargout{1,2} = seconddim_3d;
              varargout{1,3} = thirddim_3d;
        end
        
        %Returning Values <-
        
        %Algoritem <-
        
        %Error Catch ->
        
catch ME
    try 
        clf(handles.prowin);
        delete(handles.prowin);
    end
    
    if (strcmp(ME.identifier,'MyError:ErrorPrevent'))  
        rethrow(ME);
    else
        error(sprintf('vecsurf Error - Unexpected Error has occurred.\nContact support for help'));
    end
end

%Error Catch <-

%Variables Definition:
%one_dimention                               - vector of the first dimention
%second_dimention                            - vector of the second dimention
%third_dimention                             - vector of the third dimention
%onedim_rowmax                               - row max for one_dimention
%seconddim_rowmax                            - row max for second_dimention
%orgone_dimention                            - organized vector of the first dimention
%org_row                                     - organized row indicator
%followoned_row                              - row followup for one_dimention
%min_value                                   - minimal value indicator
%minv_row                                    - row of minimal value indicator
%followorgoned_row                           - row followup for orgone_dimention
%orgonedim_rowmax                            - row max of orgone_dimention
%orgsecond_dimention                         - organized vector of the second dimention
%orgseconddim_rowmax                         - row max for orgsecond_dimention
%followorgsecondd_row                        - row followup for orgsecond_dimention
%exchange_var                                - a middle variable for cell exchange operation
%followsecondd_row                           - row followup for second_dimention
%onedim_3d                                   - 3d plot matrix for vector of the first dimention
%seconddim_3d                                - 3d plot matrix for vector of the second dimention
%thirddim_rowmax                             - row max for third_dimention
%followthirdd_row                            - row followup for third_dimention
%thirddim_3d                                 - 3d plot matrix for vector of the third dimention
%followthird3d_row                           - row followup for thirddim_3d
%thirddim3d_rowmax                           - row max for thirddim_3d
%mosaic_picture                              - mosaic picture
%thirddim3d_colmax                           - col max for thirddim_3d
%followthird3d_col                           - col followup for thirddim_3d
%perimetersquare_type                        - perimeter square type
%psquareline1_relevant                       - relevant variable for line 1 in perimeter square
%psquareline2_relevant                       - relevant variable for line 2 in perimeter square
%psquareline3_relevant                       - relevant variable for line 3 in perimeter square
%psquareline4_relevant                       - relevant variable for line 4 in perimeter square
%patcell_mat                                 - pattern cell matrix in perimeter squares
%psminbound_row                              - minimum boundry for rows in perimeter square
%psmaxbound_row                              - maximum boundry for rows in perimeter square
%psminbound_col                              - minimum boundry for cols in perimeter square
%psmaxbound_col                              - maximum boundry for cols in perimeter square
%followthird3d_psrow                         - perimeter square row followup for thirddim_3d
%followthird3d_pscol                         - perimeter square col followup foe thirddim_3d
%psminmaxbound_row                           - minimum & maximum boundry for rows in perimeter square
%psminmaxbound_col                           - minimum & maximum boundry for cols in perimeter square
%followpatcell_row                           - row followup for patcell_mat
%tangus_cal                                  - part of the tangus calculations
%distance                                    - distance of pattern cell from mosaic stone to be cell
%mosaic_stone                                - mosaic stone
%followgridsecondd_row                       - row followup for gridsecond_dimention
%gridone_dimention                           - grid for the first dimention
%gridsecond_dimention                        - grid for the second dimention
%grid_point                                  - grid point
%set_value                                   - representation value for a set
%start_set                                   - indication of start set location
%end_set                                     - indication of end set location
%gridonedim_rowmax                           - row max for gridone_dimention
%gridseconddim_rowmax                        - row max for gridsecond_dimention
%warning_demand                              - warning option demand
%pattern_max                                 - number of patterns in the dimentions vectors
%followdespat_row                            - row followup for destination pattern
%num_same                                    - number of similar patterns
%followspepat_row                            - row followup for specific pattern
%followgridoned_row                          - row followup for gridone_dimention
%x100p_distance                              - represent 100 precent of distance
%gridpoints_odiminf                          - Precentage of grid points difference influence for dimention one
%gridpoints_sdiminf                          - Precentage of grid points difference influence for dimention tow
%towardsminus_gp                             - addition grid points in the minus direction of the algebric number field
%towardsplus_gp                              - addition grid points in the plus direction of the algebric number field
%gridpoints_odimincrement                    - average difference betwean grid points for dimention one
%gridpoints_sdimincrement                    - average difference betwean grid points for dimention tow
%mosaic_grid                                 - mosaic grid
%followtminus_gp                             - grid points followup for points in the minus direction of the algebric number field
%followtplus_gp                              - grid points followup for points in the plus direction of the algebric number field
%mosaic_gridpoint                            - value of mosaic grid point
%value_cal                                   - middle variable for calculating a value
%pattern_flag                                - a flag indicator for patterns which have identical patterns in a different row
%warning_flag                                - a flag indicator that represent a minimum of one warning
%patternwarning_flag                         - a flag indicator that represent a minimum of one warning for a pattern
%type_ind                                    - a type indicator that represent number of types to the screen
%same_flag                                   - a flag indicator which indicats that the current specific pattern is identical to the 
%                                              destination pattern
%warning_string                              - warning specification string for a destination pattern
%create_string                               - creating warning specification string
%warningstr_colmax                           - col max for warning_string
%createstr_colmax                            - col max for create_string
%type_flag                                   - a flag indication for first type in a destination pattern
%min_value                                   - minimal value
%firstdis_min                                - first minimal value in the distance column on the patcell_mat matrix
%newpatcell_mat                              - new pattern cell matrix in perimeter squares
%npatcell_rowmax                             - row max for newpatcell_mat
%seconddis_min                               - second minimal value in the distance column on the patcell_mat matrix
%follownpatcell_row                          - row followup for newpatcell_mat
%mosaicpicture_demand                        - mosaic picture option
%msaiconed_gp                                - mosaic grid points option for one dimension
%mosaicsecd_gp                               - mosaic grid points option for second dimension
%mosaiconed_gpboun                           - mosaic grid points boundry option for one dimension
%mosaicsecd_gpboun                           - mosaic grid points boundry option for second dimension
%warning_demand                              - repeated one and second dimention pattern warning option
%warning_spec                                - repeated one and second dimension pattern findings specification option
%progress_demand                             - progress option
%plot_demand                                 - plot option
%pointco_flag                                - error in the pointer operation flag
%onesumdef_grid                              - sum of grid points difference for dimension one
%secondsumdef_grid                           - sum of grid points difference for dimention tow
%numplus_gridpoints                          - number of grid points to add to the the original grid
%vec_bp                                      - value vector of points betwean grid points
%num_p                                       - number of points for value vector of points betwean grid points
%mosaicgc_rowmax                             - row max for mosaicgrid_create
%mosaicgrid_create                           - a matrix for the creation of a mosaic grid
%point_change                                - amount of pointer change for pointers cells
%numleft_gridpoints                          - number of grid points left to add to the original grid
%onesecd_order                               - an operation order matrix for dimension one and tow
%followosorder_col                           - col followup for onesecd_order
%osorder_colmax                              - col max for onesecd_order
%precent100_pro                              - 100 precent representation of segments worth value 
%lastp-print                                 - recent segments worth sum which was updated by the  progress graphics gui and the
%                                              progress string gui.
%minp_p                                      - represent a precent value of the 100 precent representation of the segments worth value
%precent_status                              - represent the progress status of the function
%handles.prowin                              - handle for the progress gui window
%handles.progbar                             - handle for the progress graphic gui
%handles.protex                              - handle for the progress string gui
%handles.comtex                              - handle for the calculation comleted gui message
%valpre_start                                - precent start value for a segment
%seg_val                                     - segment worth value
%segsta_pre                                  - represent the function status precent at every point
%proggpb_oneflag                             - an indication flag for the case where the one dimention actions took place
%                                              in the mosaic grid points segment
%proggpb_secflag                             - an indication flag for the case where the second dimention actions took place
%                                              in the mosaic grid points segment
%repsurf_demand                              - demand for representational three dimensional surface
%onedim_bounposb                             - boundaries possibilities vector for the first dimension
%seconddim_bounposb                          - boundaries possibilities vector for the second dimension
%towdim_boungrid                             - tow dimensional boundry grid
%followorgdim_pat                            - pattern followup for the original dimension vectors
%orgpat_max                                  - pattern max for the original dimension vectors
%followonedbp_pat                            - pattern followup for onedim_bounposb
%followsecondbp_pat                          - pattern followup for seconddim_bounposb
%onebounfound_ind                            - fitting boundry for the pattern in the original first dimension vector in the
%                                              boundaries possibilities vector for the first dimension
%secbounfound_ind                            - fitting boundry for the pattern in the original second dimension vector in the
%                                              boundaries possibilities vector for the second dimension
%onedimbp_patmax                             - max pattern for onedim_bounposb
%seconddimbp_patmax                          - max pattern for seconddim_bounposb
%error_flag                                  - error flag
%thirddim3d_pass                             - defines passes and actions for the squares smooth algoritem
%thirddim3d_passtype                         - defines type of passes and actions for the squares smooth algoritem                                              
%surfacesmooth_times                         - number of smooth actions
%smooth                                      - parameters of smooth algoritem
%thirddim3d_edgepass                         - defines passes,actions and the type of them for edge smooth algoritem
%thirddim3d_numpass                          - defines number of passes for a loop in smooth algoritem
%spesquare_numpoints                         - number of points to a specific square
%gensquare_switch                            - continuum switch for general squares in a specific passs
%spesquare_numpass                           - number of passes for a specific square
%followthird3dspe_row                        - row followup for a specific square in thirddim_3d
%followthird3dspe_col                        - col followup for a specific square in thirddim_3d
%squarepoints_sum                            - sum value for points in a specific square
%squarepoints_sumavg                         - sum average for points in a specific square
%edgepass_switch                             - continuum switch for a specific edge pass
%progress_counter                            - progress variable
%progressc_100p                              - represent a value for progress precentage caculation
%oldgridsecd_rowmax                          - row max for gridsecond_dimention before it might
%                                              change in mosaic grid points option
%oldgridoned_rowmax                          - row max for gridone_dimention before it might
%                                              change in mosaic grid points option
%RepOneBoun                                  - variable for representational three dimensional surface grid value
%                                              boundry option for dimension one 
%RepSecBoun                                  - variable for representational three dimensional surface grid value
%                                              boundry option for dimension tow 

%Algoritem Clarification:
%This algoritem was created firstly by a written flow chart. Therefor, the program comment's
%refer to the written flow chart.

%Algoritem addition:
%Inorder to transform the written flow chart into a written program addition commands were
%added to the algoritem, hence the flag variable's.

%Flag use:
%When the condition - flag == 0 - is used the flag is used to get out of the loop
%When the condition - flag == 1 - is used the flag is used to stay in the loop
%When the flag is used in an if condition - it is used to jump to the loop condition
%Structure definition:
%Flag has three parts: 1:flag,2:_cj_,3:I.
%The first part is declaration to the flag.
%The second part is a delcaration of the action the flag is belong to, if there are a number of action's which the
%flag belong to a,b,c,d and etc.. will separate that action's respectively to the order they were written.
%The third part has three option's: 1)If it's a captial letter - the flag declars in one case a return to
%an action in the algoritem, and in another case it declars to move forward to an action in the algoritem.
%2)if it's not a capital letter - the flag delare a return to a letter jump in the algoritem.3)The frase RV 
%represent Return Value Segment. It acts like option 1.
%Flag In Use:
%flag_v_III 
%flag_ixv_XII
%flag_iii_IXV
%flag_iii_a
%flag_vii_IIX
%flag_aivbiix_RV
%flag_iv_a
%flag_xxi_a
%flag_xxxi_a
%flag_xxxxvi_a
%flag_ixx_XX
%flagiixv_IIXXV

%Patche implementation:
%Patche 1 implemented successfully...
%Patche 2 implemented successfully...
%Patche 3 implemented successfully...
%Patche 4 implemented successfully...
%Patche 5 implemented successfully...
%Patche 6 implemented successfully...
%Patche 7 implemented successfully...
%Patche 8 implemented successfully...
%Patche 9 implemented successfully...
%Patche 10 implemented successfully...
%Patche 11 implemented successfully...
%Patche 12 implemented successfully...

function reminder = modt(number1,number2)

%Modulas Tani Function -
%The goal of this function is to produce the reminder of a number or 
%of a division. It can get either one or tow numbers respectively to
%the type of reminder demanded. In the case of one number the reminder
%will be of that number, In the other case the reminder will be of the
%divition betwean the first and second number. To use the function
%type it as follow's: reminder = modt(number1,number2).
%Good Luck!!!

%Debbuging ->

%Debbuging for input and output parameter's ->

if(nargin < 1 | nargin >2)
   error('MyError:ErrorPrevent','modt Error - Worng number of input argument''s');
elseif(nargout ~= 1)
   error('MyError:ErrorPrevent','modt Error - Worng number of output argument''s');
end

%Debbuging for input and output parameter's <-

%Algoritem ->

%Calculating The Reminder ->

%Action I ->

if(nargin == 1)
   
   %Action I <-
   
   %Action II ->
   
   number1_int = floor(number1);
   number1_int = double(number1_int);
   reminder = number1 - number1_int;
   
   %Action II <-
   
else
   
   %Action III ->
   
   div = number1/number2;
   div_int = floor(div);
   div_int = double(div_int);
   reminder = div - div_int;
   
   %Action III <-
   
   %Action I ->
   
end

%Action I <-

%Calculating The Reminder <-

%Returining Value's ->

%Returning reminder variable

%Returning Value's <-

%Algoritem <-

%Variable Definition:
%number1                      - first number
%number2                      - second number
%reminder                     - reminder number
%number1_int                  - int class value for number1
%div                          - divided value 
%div_int                      - int class for divided value 



  
