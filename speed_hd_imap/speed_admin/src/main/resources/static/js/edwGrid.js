/********************
 * 作者：Ediwa
 * 插件名称：EdwGrid
 * 依赖项：JQuery 1.3.2以上
 * 最后修改日期：2014-10-14
 ********************/

!function ($) {
    //加载皮肤
    (function () {
        var rName = new RegExp("edwGrid.js" + "(\\?(.*))?$");
        var scripts = document.getElementsByTagName('script');
        var me;
        for (var i = 0; i < scripts.length; i++) {
            if (scripts[i].src && scripts[i].src.match(rName)) me = scripts[i];
        }
        var _thisScript = me || scripts[scripts.length - 1];
        me = _thisScript.src.replace(/\\/g, '/');
        var _path = me.lastIndexOf('/') < 0 ? '.' : me.substring(0, me.lastIndexOf('/'));
        _skin = _thisScript.src.split('skin=')[1] || "default";
        if (_skin) {
            var link = document.createElement('link');
            link.rel = 'stylesheet';
            link.href = _path + '/skins/' + _skin + '/skin.css';
            _thisScript.parentNode.insertBefore(link, _thisScript);
        }
    })();

    //声明表格对象
    var EdwGrid = function (element, options) {
        this._name = 'edwGrid',
            this._version = '1.0.0',
            this._id = (((1 + Math.random()) * 0x10000) | 0).toString(16);
        this._loadCount = 0;
        this.opts = options;
        this._initLayout($(element));
        this._initHead();
        this._initOptions();
        this._initEvents();
        this._setColsWidth();
        if (this.opts.fullWidthRows) { this._fullWidthRows(); }

        //初始化插件
        for (var i = 0; i < this.opts.plugins.length; i++) {
            var plugin = this.opts.plugins[i];
            plugin.init($.extend(element, this));
        }

        if (options.autoLoad) {
            var that = this;
            this.opts = options;
            setTimeout(function () {
                that.load(options.items);
            }, 0); //chrome问题
        }
    };

    //验证浏览器，参考: http://tanalin.com/en/articles/ie-version-js/
    var browser = function () {
        var isIE = !!window.ActiveXObject;
        var isIE10 = isIE && !!window.atob;
        var isIE9 = isIE && document.addEventListener && !window.atob;
        var isIE8 = isIE && document.querySelector && !document.addEventListener;
        var isIE7 = isIE && window.XMLHttpRequest && !document.querySelector;
        var isIE6 = isIE && !window.XMLHttpRequest;

        return {
            isIE: isIE
            , isIE6: isIE6
            , isIE7: isIE7
            , isIE8: isIE8
            , isIE9: isIE9
            , isIE10: isIE10
        };
    }();

    //表格对象原型拓展
    EdwGrid.prototype = {
        //加载布局
        _initLayout: function ($el) {
            var opts = this.opts;
            var $elParent = $el.parent();
            var elIndex = $el.index();
            //表格基本框架
            var edwGrid = [
                '<div class="edwGrid">',
                '<style></style>',
                '<div class="edw-headWrapper">', /*头部容器*/
                '<table class="edw-head" cellspacing="0"></table>',
                '</div>',
                '<div class="edw-colResizePointer"></div>',
                '<div class="edw-colResizePointer-before"></div>',
                '<div class="edw-backboard">',
                '<a class="edw-btnBackboardUp"></a>',
                '</div>',
                '<div class="edw-bodyWrapper"></div>', /*内容容器*/
                '<a class="edw-btnBackboardDn"></a>',
                '<div class="edw-message">' + this.opts.noDataText + '</div>',
                '<div class="edw-footWrapper"></div>', /*底部容器*/
                '<div class="edw-mask edw-transparent"></div>',
                '<div class="edw-loading">',
                '<div class="edw-loadingImg"></div>',
                '<div class="edw-loadingText">' + this.opts.loadingText + '</div>',
                '</div>',
                '</div>'
            ];
            //兼容IE6,IE7样式
            if (browser.isIE7 || browser.isIE6) {
                $el.prop('cellspacing', 0);
            }
            //缓存对象
            var $edwGrid = $(edwGrid.join('')).attr("style", $el.attr('style'));
            this.$edwGrid = $edwGrid;
            this.$style = $edwGrid.find('style');
            this.$headWrapper = $edwGrid.find('.edw-headWrapper');
            this.$head = $edwGrid.find('.edw-head');
            this.$backboard = $edwGrid.find('.edw-backboard');
            this.$bodyWrapper = $edwGrid.find('.edw-bodyWrapper');
            this.$body = $el.removeAttr('style').addClass('edw-body');
            this.$footWrapper = $edwGrid.find('.edw-footWrapper');
            this._insertEmptyRow();
            this.$body.appendTo(this.$bodyWrapper);
            //放回原位置
            if (elIndex === 0 || $elParent.children().length == 0) {
                $elParent.prepend(this.$edwGrid);
            } else {
                $elParent.children().eq(elIndex - 1).after(this.$edwGrid);
            }

            // 兼容ie6 宽度
            if (browser.isIE6 && (!opts.width || opts.width === 'auto')) {
                $edwGrid.width('100%');
                $edwGrid.width($edwGrid.width() - ($edwGrid.outerWidth(true) - $edwGrid.width()));
            } else {
                $edwGrid.width(opts.width);
            }
            // 兼容ie6 高度
            if (browser.isIE6 && (!opts.height || opts.height === 'auto')) {
                $edwGrid.height('100%');
                $edwGrid.height($edwGrid.height() - ($edwGrid.outerHeight(true) - $edwGrid.height()));
            } else {
                $edwGrid.height(opts.height);
            }

            //如果需要分页
            if (opts.ajaxUrl) {
                this.opts.autoLoad = false; //如果分页，则取消自动加载,使用分页加载
                this.initPaginator();
            }

            //如果需要复选框
            if (opts.checkCell) {
                var chkHtml = opts.multiSelect ? '<input type="checkbox" class="checkAll" style="margin-top:1px;"/>' : '<input type="checkbox" disabled="disabled" class="checkAll" style="margin-top:1px;"/>';
                opts.colModel.unshift({
                    dataField: 'edw-check', title: chkHtml, width: opts.indexColWidth, align: 'center', lockWidth: true, checkCell: true, render: function () {
                        return '<input type="checkbox" class="edw-check">';
                    }
                });
            }
            //如果需要列索引   注:索引必须为第一列，此处代码必须置于最后
            if (opts.indexCell) {
                opts.colModel.unshift({
                    dataField: 'edw-index', title: '&nbsp;', width: opts.indexColWidth, align: 'center', lockWidth: true, indexCell: true, render: function (ui) {
                        return '<label class="edw-index">' + (ui.rowIndex + 1) + '</label>';
                    }
                });
            }
        }

        //展开列
        , _expandCols: function (colModel) {
            var newCols = [];
            if (!colModel) {
                return newCols;
            }
            for (var colIndex = 0; colIndex < colModel.length; colIndex++) {
                var col = colModel[colIndex];
                if (col.colModel) {
                    newCols.push(col);
                    newCols.push.apply(newCols, this._expandCols(col.colModel));
                } else {
                    newCols.push(col);
                }
            }
            return newCols;
        }
        , _leafCols: function () {
            var opts = this.opts;
            var newCols = [];
            var colModel = this._expandCols(opts.colModel);
            for (var colIndex = 0, len = colModel.length; colIndex < len; colIndex++) {
                var col = colModel[colIndex];
                if (!col.colModel) {
                    newCols.push(col);
                }
            }
            return newCols;
        }

        //展开th行
        , _expandThs: function () {
            return this.$head.find('th').sort(function (a, b) {
                return parseInt($(a).data('colindex')) - parseInt($(b).data('colindex'));
            });
        }
        , _leafThs: function () {
            return this.$head.find('th').filter(function () {
                return !$.data(this, 'col').colModel;
            }).sort(function (a, b) {
                return parseInt($(a).data('colindex')) - parseInt($(b).data('colindex'));
            });
        }

        //列标题多级深度，暂支持2层
        , _colsWithTitleDeep: function (colModel, deep) {
            var newCols = [];
            if (!colModel) {
                return newCols;
            }
            for (var colIndex = 0; colIndex < colModel.length; colIndex++) {
                var col = colModel[colIndex];
                if (deep === 1) {
                    newCols.push(col);
                } else {
                    newCols.push.apply(newCols, this._colsWithTitleDeep(col.colModel, deep - 1));
                }
            }
            return newCols;
        }

        , _titleDeep: function (colModel) {
            var deep = 1;
            for (var colIndex = 0; colIndex < colModel.length; colIndex++) {
                var col = colModel[colIndex];
                if (col.colModel) {
                    var newDeep = 1 + this._titleDeep(col.colModel);
                    if (deep < newDeep) {
                        deep = newDeep;
                    }
                }
            }
            return deep;
        }

        //标题html
        , _titleHtml: function (col, rowspan) {
            var opts = this.opts;

            var titleHtml = [];
            if (!col.colModel) {
                titleHtml.push('<th class="');
                var colIndex = $.inArray(col, this._expandCols(opts.colModel));
                titleHtml.push(this._genColClass(colIndex));
                titleHtml.push(' " ');
                titleHtml.push(' rowspan="');
                titleHtml.push(rowspan);
                titleHtml.push('" colspan="');
                titleHtml.push(1);
                titleHtml.push('" data-colIndex="');
                titleHtml.push(colIndex);
                titleHtml.push('" >');
                titleHtml.push('<div class="edw-titleWrapper" >');
                titleHtml.push('<span class="edw-title ');
                if (col.sortable) titleHtml.push('edw-canSort ');
                titleHtml.push('">');
                if (col.titleHtml) {
                    titleHtml.push(col.titleHtml);
                } else {
                    titleHtml.push(col.title);
                }
                titleHtml.push('</span><div class="edw-sort"></div>');
                if (!col.lockWidth) titleHtml.push('<div class="edw-colResize"></div>');
                titleHtml.push('</div></th>');
            } else {
                var displayColsLength = col.colModel.length;
                $.each(col.colModel, function (index, item) {
                    if (item.hidden) {
                        displayColsLength--;
                    }
                });
                if (displayColsLength === 0) {
                    col.hidden = true;
                }
                titleHtml.push('<th class="');
                var colIndex = $.inArray(col, this._expandCols(opts.colModel));
                titleHtml.push(this._genColClass(colIndex));
                titleHtml.push(' edw-groupCol" ');
                titleHtml.push(' rowspan="');
                titleHtml.push(rowspan - 1);
                titleHtml.push('" colspan="');
                titleHtml.push(displayColsLength);
                titleHtml.push('" data-colIndex="');
                titleHtml.push(colIndex);
                titleHtml.push('" >');
                titleHtml.push('<div class="edw-titleWrapper" >');
                titleHtml.push('<span class="edw-title ');
                if (col.sortable) titleHtml.push('edw-canSort ');
                titleHtml.push('">');
                if (col.titleHtml) {
                    titleHtml.push(col.titleHtml);
                } else {
                    titleHtml.push(col.title);
                }
                titleHtml.push('</span><div class="edw-sort"></div>');
                titleHtml.push('</div></th>');
            }

            return titleHtml.join("");
        }
        //初始化头部
        , _initHead: function () {
            var that = this;
            var opts = this.opts;
            var $head = this.$head;

            if (opts.colModel) {
                var theadHtmls = ['<thead>'];

                //获取标题深度
                var titleDeep = that._titleDeep(opts.colModel);
                for (var deep = 1; deep <= titleDeep; deep++) {
                    var colModel = that._colsWithTitleDeep(opts.colModel, deep);
                    theadHtmls.push('<tr>');
                    for (var colIndex = 0; colIndex < colModel.length; colIndex++) {
                        var col = colModel[colIndex];
                        theadHtmls.push(this._titleHtml(col, titleDeep - deep + 1));
                    }
                    theadHtmls.push('</tr>');
                }
                theadHtmls.push('</thead>');
                $head.html(theadHtmls.join(''));
            }

            var $ths = this._expandThs();
            var expandCols = this._expandCols(opts.colModel);
            $.each($ths, function (index) {
                if (!expandCols[index].width) {
                    expandCols[index].width = 100;
                }
                $.data(this, 'col-width', expandCols[index].width);
                $.data(this, 'col', expandCols[index]);
            });

            var $edwGrid = this.$edwGrid;
            var $headWrapper = this.$headWrapper;
            var $bodyWrapper = this.$bodyWrapper;
            var $footWrapper = this.$footWrapper;
            if (opts.height !== 'auto') {
                $bodyWrapper.height($edwGrid.height() - $headWrapper.outerHeight(true) - $footWrapper.outerHeight(true));
            }

            //初始化排序状态
            if (opts.sortName) {
                for (var colIndex = 0; colIndex < expandCols.length; colIndex++) {
                    var col = expandCols[colIndex];
                    if (col.sortName === opts.sortName || col.dataField === opts.sortName) {
                        var $th = $ths.eq(colIndex);
                        $.data($th.find('.edw-title')[0], 'sortStatus', opts.sortStatus);
                        $th.find('.edw-sort').addClass('edw-' + opts.sortStatus);
                    }
                }
            }
        }

        //初始化动态头标签参数
        , _initOptions: function () {
            var opts = this.opts;
            var $edwGrid = this.$edwGrid;
            var $headWrapper = this.$headWrapper;
            var $backboard = this.$backboard;
            $edwGrid.find('a.edw-btnBackboardDn').css({ 'top': $headWrapper.outerHeight(true) }).slideUp('fast');

            var colModel = this._leafCols();
            if (colModel) {
                var bbHtml = ['<h1>显示列</h1>'];
                for (var colIndex = 0; colIndex < colModel.length; colIndex++) {
                    bbHtml.push('<label ');
                    if (colModel[colIndex].checkCell || colModel[colIndex].indexCell) {
                        bbHtml.push('style="display:none;" ');
                    }
                    var col = colModel[colIndex];
                    bbHtml.push(">");
                    if (col.title) {
                        bbHtml.push('<input type="checkbox"  ');
                        if (!col.hidden) bbHtml.push('checked="checked"');
                        if (col.lockView) bbHtml.push(' disabled="disabled"');
                        bbHtml.push('/><span>');
                        bbHtml.push(col.title);
                        bbHtml.push("</span>");
                    }
                    bbHtml.push('</label>');
                }
                $backboard.append($(bbHtml.join('')));
            }
        }

        //初始化事件驱动
        , _initEvents: function () {
            var that = this;
            var opts = this.opts;
            var $edwGrid = this.$edwGrid;
            var $headWrapper = this.$headWrapper;
            var $head = this.$head;
            var $bodyWrapper = this.$bodyWrapper;
            var $body = this.$body;
            var $footWrapper = this.footWrapper;
            var $backboard = this.$backboard;
            var $ths = this._expandThs();
            var expandCols = this._expandCols(opts.colModel);
            var leafCols = this._leafCols();

            //调整浏览器
            if (opts.width === 'auto' || opts.height === 'auto' || (typeof opts.width === 'string' && opts.width.indexOf('%') === opts.width.length - 1) ||
                typeof opts.height === 'string' && opts.height.indexOf('%') === opts.height.length - 1) {
                //调整多余高度
                if (!isNaN(opts.height)) {
                    that.jianHeight = $(window).height() - opts.height;
                }
                //注册事件
                $(window).on('resize', function () {
                    that.resize();
                    if (that.opts.fullWidthRows) { that._fullWidthRows(); } //自动填充列宽
                });
            }

            //滚动条事件
            $bodyWrapper.on('scroll', function () {
                $head.css('left', - $(this).scrollLeft());
            });

            //向下按钮
            var $btnBackboardDn = $edwGrid.find('a.edw-btnBackboardDn').on('click', function () {
                var backboardHeight = $edwGrid.height() - $headWrapper.outerHeight(true);
                if (opts.height === 'auto' && opts.backboardMinHeight !== 'auto' && backboardHeight < opts.backboardMinHeight) {
                    backboardHeight = opts.backboardMinHeight;
                }
                $backboard.height(backboardHeight);
                if (opts.height === 'auto') {
                    $edwGrid.height($headWrapper.outerHeight(true) + $backboard.outerHeight(true));
                }
                $backboard.slideDown();
                $btnBackboardDn.slideUp('fast');

                that._hideMessage();
            });
            $body.on('mouseenter', function () {
                $btnBackboardDn.slideUp('fast');
            });
            $edwGrid.on('mouseleave', function () {
                $btnBackboardDn.slideUp('fast');
            });
            $headWrapper.on('mouseenter', function () {
                if ($backboard.is(':hidden') && opts.showBackboard) {
                    $btnBackboardDn.slideDown('fast');
                }
            });
            //向上按钮
            $edwGrid.find('a.edw-btnBackboardUp').on('click', function () {
                $backboard.slideUp().queue(function (next) {
                    if (!that.rowsLength() || (that.rowsLength() === 1 && $body.find('tr.emptyRow').length === 1)) {
                        that._showNoData();
                    }
                    if (opts.height === 'auto') {
                        $edwGrid.height('auto');
                    }
                    next();
                });
            });

            //隐藏列
            $backboard.on('click', ':checkbox', function () {
                var index = $backboard.find('label').index($(this).parent());
                //最后一个不隐藏
                var last = 1;
                if (opts.checkCell) {
                    last = last + 1;
                }
                if (opts.indexCell) {
                    last = last + 1;
                }
                if ($backboard.find('label :checked').length < last) {
                    this.checked = true;
                    return;
                }

                var col = leafCols[index];
                if (this.checked) {
                    col.hidden = false;

                } else {
                    col.hidden = true;
                }

                var $ths = $head.find('th');
                for (var colIndex = $ths.length - 1; colIndex >= 0; colIndex--) {
                    var $th = $ths.eq(colIndex);
                    var iCol = $th.data('col');
                    if (iCol.colModel) {
                        var hidden = true;
                        var colspan = 0;
                        $.each(iCol.colModel, function (index, item) {
                            if (!item.hidden) {
                                hidden = false;
                                colspan++;
                            }
                        });
                        //IE bug
                        if (colspan !== 0) {
                            $th.prop('colspan', colspan);
                        }
                        iCol.hidden = hidden;
                    }
                }

                that._setColsWidth();
                $backboard.height($edwGrid.height() - $headWrapper.outerHeight(true));
                if (opts.height !== 'auto') {
                    $bodyWrapper.height($edwGrid.height() - $headWrapper.outerHeight(true) - that.$footWrapper.outerHeight(true));
                }
                $edwGrid.find('a.edw-btnBackboardDn').css({
                    'top': $headWrapper.outerHeight(true)
                })
            });

            //排序事件
            $head.on('click', '.edw-title', function () {
                var $this = $(this);
                var $titles = $ths.find('.edw-title');

                //当前列不允许排序
                var col = $this.parent().parent().data('col');
                if (!col.sortable) {
                    return;
                }
                //取得当前列下一个排序状态
                var sortStatus = $.data(this, 'sortStatus') === 'asc' ? 'desc' : 'asc';
                //清除排序状态
                $.each($titles, function () {
                    $.removeData(this, 'sortStatus');
                });
                $ths.find('.edw-sort').removeClass('edw-asc').removeClass('edw-desc');
                //设置当前列排序状态
                $.data(this, 'sortStatus', sortStatus);
                $this.siblings('.edw-sort').addClass('edw-' + sortStatus);

                if (opts.ajaxUrl && opts.remoteSort) {
                    that.load()
                } else {
                    that._nativeSorter($.inArray(col, leafCols), sortStatus);
                    that._setStyle();
                }
            }).on('mousedown', '.edw-colResize', function (e) {
                //调整列宽
                var $resize = $(this);
                var start = e.pageX;
                var $colResizePointer = $edwGrid.find('.edw-colResizePointer')
                    .css('left', e.pageX - $headWrapper.offset().left).show();

                var scrollLeft = $head.position().left;
                var $colResizePointerBefore = $edwGrid.find('.edw-colResizePointer-before')
                    .css('left', $resize.parent().parent().position().left + scrollLeft).show();
                //取消文字选择
                document.selection && document.selection.empty && (document.selection.empty(), 1)
                    || window.getSelection && window.getSelection().removeAllRanges();
                document.body.onselectstart = function () {
                    return false;
                };
                $headWrapper.css('-moz-user-select', 'none');

                $edwGrid.on('mousemove', function (e) {
                    $colResizePointer.css('left', e.pageX - $headWrapper.offset().left);
                }).on('mouseup', function (e) {
                    //改变宽度
                    var $th = $resize.parent().parent();
                    var width = $th.width() + e.pageX - start;
                    $.data($th[0], 'col-width', width);
                    that._setColsWidth();
                    $headWrapper.mouseleave();
                }).on('mouseleave', function () {
                    $edwGrid.off('mouseup').off('mouseleave').off('mousemove');
                    $colResizePointer.hide();
                    $colResizePointerBefore.hide();
                    document.body.onselectstart = function () {
                        return true;//开启文字选择
                    };
                    $headWrapper.css('-moz-user-select', 'text');
                });
            });

            //选中事件
            var $body = this.$body;
            $body.on('click', 'td', function (e) {
                var $this = $(this);
                var event = jQuery.Event("cellSelected");
                if (event.isPropagationStopped()) {
                    return;
                }
                var flag = false;
                //如果非复选框列选中，则取消多选
                if ($this.find(".edw-check").length < 1 && opts.multiSelect) {
                    opts.multiSelect = false; flag = true;
                }

                if (!$this.parent().hasClass('selected')) {
                    that.select($this.parent().index());
                } else {
                    //如果不是点击的td本身,则取消
                    if (!e.target.protocol) {
                        that.deselect($this.parent().index());
                    }
                }

                if (flag) { opts.multiSelect = true; } //恢复多选
                event.target = e.target;
                that.$body.triggerHandler(event, [$.data($this.parent()[0], 'item'), $this.parent().index(), $this.index()]);
            });

            $body.on('click', 'tr > td .edw-check', function (e) {
                e.stopPropagation();
                var $this = $(this);
                if (this.checked) {
                    that.select($($this.parents('tr')[0]).index());
                } else {
                    that.deselect($($this.parents('tr')[0]).index());
                }
                var event = jQuery.Event("cellSelected");
                event.target = e.target;
                that.$body.triggerHandler(event, [$.data($this.parents("tr")[0], 'item'), $this.parent().index(), $this.index()]);
            });

            //checkbox列
            if (opts.checkCell) {
                $head.find('th .checkAll').on('click', function () {
                    if (this.checked) {
                        that.select('all');
                    } else {
                        that.deselect('all');
                    }
                });
            }

            //IE6不支持hover
            if (browser.isIE6) {
                $body.on('mouseenter', 'tr', function () {
                    $(this).toggleClass('hover');
                }).on('mouseleave', 'tr', function () {
                    $(this).toggleClass('hover');
                });
            };
        }

        //表格行html代码生成
        , _rowHtml: function (item, rowIndex) {
            var opts = this.opts;
            var expandCols = this._expandCols(opts.colModel);
            var leafCols = this._leafCols();

            if ($.isPlainObject(item)) {
                var trHtml = [];
                trHtml.push('<tr>');
                for (var colIndex = 0, len = leafCols.length; colIndex < len; colIndex++) {
                    var col = leafCols[colIndex];
                    trHtml.push('<td class="');
                    var index = $.inArray(col, expandCols);
                    trHtml.push(this._genColClass(index));
                    if (opts.nowrap) {
                        trHtml.push(' nowrap');
                    }
                    if (opts.indexCell && col.dataField == "edw-index") {
                        trHtml.push(' index-cell');
                    }
                    trHtml.push('"><span class="');
                    if (opts.nowrap) {
                        trHtml.push('nowrap');
                        //trHtml.push('" title="' + item[col.dataField] + '');
                    }
                    trHtml.push('">');
                    if (col.render) {
                        var data = { "rowData": item, "rowIndex": rowIndex };
                        trHtml.push(col.render(data));
                    } else {
                        trHtml.push(item[col.dataField]);
                    }
                    trHtml.push('</span></td>');
                };
                trHtml.push('</tr>');
                return trHtml.join('');
            }
        }

        , _populate: function (items) {
            var opts = this.opts;
            var $body = this.$body;

            this._hideMessage();
            if (items && items.length !== 0 && opts.colModel) {
                var tbodyHtmls = [];
                tbodyHtmls.push('<tbody>');
                for (var rowIndex = 0; rowIndex < items.length; rowIndex++) {
                    var item = items[rowIndex];
                    tbodyHtmls.push(this._rowHtml(item, rowIndex));
                }
                tbodyHtmls.push('</tbody>');
                $body.empty().html(tbodyHtmls.join(''));
                var $trs = $body.find('tr');
                for (var rowIndex = 0; rowIndex < items.length; rowIndex++) {
                    $.data($trs.eq(rowIndex)[0], 'item', items[rowIndex]);
                }
            } else {
                this._insertEmptyRow();
                this._showNoData();
            }
            this._setStyle();

            if (opts.fullWidthRows && this._loadCount <= 1) {
                this._fullWidthRows();
            }
        }
        //插入空行
        , _insertEmptyRow: function () {
            var $body = this.$body;
            $body.empty().html('<tbody><tr class="emptyRow"><td  style="border: 0px;background: none;">&nbsp;</td></tr></tbody>');
        }
        //删除空行
        , _removeEmptyRow: function () {
            var $body = this.$body;
            $body.find('tr.emptyRow').remove();
        }

        //生成列样式名称
        , _genColClass: function (colIndex) {
            return 'edw' + this._id + '-col' + colIndex;
        }
        //设置样式
        , _setStyle: function () {
            var $head = this.$head;
            var $ths = this._expandThs();
            var $body = this.$body;
            var leafCol = this._leafCols();

            //head
            $ths.eq(0).addClass('first');
            $ths.eq(-1).addClass('last');
            //body
            $body.find('tr,td').removeClass('even')
                .removeClass('colSelected').removeClass('colSelectedEven');

            $body.find('tr:odd').addClass('even');

            var sortIndex = $.inArray($head.find('.edw-title').filter(function () {
                return $.data(this, 'sortStatus') === 'asc' || $(this).data('sortStatus') === 'desc';
            }).parent().parent().data('col'), leafCol);

            $body.find('tr > td:nth-child(' + (sortIndex + 1) + ')').addClass('colSelected')
                .filter(':odd').addClass('colSelectedEven');

            this._resizeHeight();
        }
        //设置列宽度
        , _setColsWidth: function () {
            var opts = this.opts;
            var $style = this.$style;
            var $head = this.$head;

            var $bodyWrapper = this.$bodyWrapper;
            var $body = this.$body;
            var $ths = this._expandThs();
            var expandCols = this._expandCols(opts.colModel);

            var scrollTop = $bodyWrapper.scrollTop();
            var scrollLeft = $head.position().left;

            $bodyWrapper.width(9999);
            $body.width('auto');
            var styleText = [];
            for (var colIndex = 0; colIndex < $ths.length; colIndex++) {
                var $th = $ths.eq(colIndex);
                styleText.push('.edwGrid .' + this._genColClass(colIndex) + ' {');
                var width = $.data($th[0], 'col-width');
                styleText.push('width: ' + width + 'px;');
                styleText.push('max-width: ' + width + 'px;');

                var col = expandCols[colIndex];
                if (col.align) {
                    styleText.push('text-align: ' + col.align + ';');
                }
                if (col.hidden) {
                    styleText.push('display: none; ');
                }
                styleText.push(' }');
            }

            $body.detach();
            try {
                $style.text(styleText.join(''));
            } catch (error) {
                $style[0].styleSheet.cssText = styleText.join('');//IE fix
            }
            $body.width($head.width());
            $bodyWrapper.width('100%');
            $bodyWrapper.append($body);

            //调整滚动条
            $bodyWrapper.scrollLeft(-scrollLeft);
            if ($bodyWrapper.scrollLeft() === 0) {
                $head.css('left', 0);
            }

            $bodyWrapper.scrollTop(scrollTop);
        }
        , _fullWidthRows: function () {
            var opts = this.opts;
            var $bodyWrapper = this.$bodyWrapper;
            var $edwGrid = this.$edwGrid;
            var $head = this.$head;
            var scrollWidth = $bodyWrapper.width() - $bodyWrapper[0].clientWidth;

            if (scrollWidth && browser.isIE) {
                scrollWidth = scrollWidth + 1;
            }

            var fitWidth = $edwGrid.width() - $head.width() - scrollWidth;
            //if (fitWidth < -20) {
            //    return;
            //}

            var thsArr = [];
            var $ths = this._leafThs();
            var leafCol = this._leafCols();
            for (var i = 0; i < leafCol.length; i++) {
                var col = leafCol[i];
                var $th = $ths.eq(i);
                if (!col.lockWidth && $th.is(':visible')) {
                    thsArr.push($th);
                }
            }

            var increaseWidth = Math.floor(fitWidth / thsArr.length);
            var maxColWidthIndex = 0;
            for (var i = 0; i < thsArr.length; i++) {
                var $th = thsArr[i];
                var colWidth = $.data($th[0], 'col-width') + increaseWidth;
                $.data($th[0], 'col-width', colWidth);

                var maxColWidth = $.data(thsArr[maxColWidthIndex][0], 'col-width');
                if (maxColWidth < colWidth) {
                    maxColWidthIndex = i;
                }
            }

            var remainWidth = fitWidth - increaseWidth * thsArr.length;
            var maxColWidth = $.data(thsArr[maxColWidthIndex][0], 'col-width');
            $.data(thsArr[maxColWidthIndex][0], 'col-width', maxColWidth + remainWidth);
            this._setColsWidth();
        }

        //显示加载动画
        , _showLoading: function () {
            var $edwGrid = this.$edwGrid;
            $edwGrid.find('.edw-mask').show();

            var $loading = $edwGrid.find('.edw-loading');
            $loading.css({
                'left': ($edwGrid.width() - $loading.width()) / 2,
                'top': ($edwGrid.height() - $loading.height()) / 2
            }).show();
        }
        //隐藏加载动画
        , _hideLoading: function () {
            var $edwGrid = this.$edwGrid;
            $edwGrid.find('.edw-mask').hide();
            $edwGrid.find('.edw-loading').hide();
        }
        //显示无数据提示
        , _showNoData: function () {
            this._showMessage(this.opts.noDataText);
        }
        //显示加载失败提示
        , _showLoadError: function () {
            this._showMessage(this.opts.loadErrorText);
        }
        //显示提示
        , _showMessage: function (msg) {
            var $edwGrid = this.$edwGrid;
            var $headWrapper = this.$headWrapper;
            var $message = $edwGrid.find('.edw-message');
            $message.css({
                'left': ($edwGrid.width() - $message.width()) / 2,
                'top': ($edwGrid.height() + $headWrapper.height() - $message.height()) / 2
            }).text(msg).show();
        }
        //隐藏提示
        , _hideMessage: function () {
            var $edwGrid = this.$edwGrid;
            $edwGrid.find('.edw-message').hide();
        }

        , _nativeSorter: function (colIndex, sortStatus) {
            var leafCols = this._leafCols();
            var col = leafCols[colIndex];

            this.$body.find('tr > td:nth-child(' + (colIndex + 1) + ')')
                .sortElements(function (a, b) {
                    var av = $.text($(a));
                    var bv = $.text($(b));
                    //排序前转换
                    if (col.dataType === 'number') {
                        av = parseFloat(av);
                        bv = parseFloat(bv);
                    } else {
                        //各个浏览器localeCompare的结果不一致
                        return sortStatus === 'desc' ? -av.localeCompare(bv) : av.localeCompare(bv);
                    }
                    return av > bv ? (sortStatus === 'desc' ? -1 : 1) : (sortStatus === 'desc' ? 1 : -1);
                }, function () {
                    return this.parentNode;
                });
        }

        //刷新排序状态
        , _refreshSortStatus: function () {
            var $ths = this.$head.find('th');
            var sortColIndex = -1;
            var sortStatus = '';
            $ths.find('.edw-title').each(function (index, item) {
                var status = $.data(item, 'sortStatus');
                if (status) {
                    sortColIndex = index;
                    sortStatus = status;
                }
            });
            var sortStatus = sortStatus === 'desc' ? 'asc' : 'desc';
            if (sortColIndex >= 0) {
                $ths.eq(sortColIndex).find('.edw-title').data('sortStatus', sortStatus).click();
            }
        }
        //加载ajax数据
        , _loadAjax: function (args) {
            var that = this;
            var opts = this.opts;
            var params = {};
            //opt的params可以使函数，例如收集过滤的参数
            if ($.isFunction(opts.params)) {
                var p = opts.params();
                if (!p) {
                    return;
                }
                params = $.extend(params, p);
            } else if ($.isPlainObject(opts.params)) {
                params = $.extend(params, opts.params);
            }

            if (opts.remoteSort) {
                var sortName = '';
                var sortStatus = '';
                var $titles = this.$head.find('.edw-title');
                for (var colIndex = 0; colIndex < $titles.length; colIndex++) {
                    var status = $.data($titles[colIndex], 'sortStatus');
                    if (status) {
                        var col = $titles.eq(colIndex).parent().parent().data('col');
                        sortName = col.sortName ?
                            col.sortName : col.dataField;
                        sortStatus = status;
                    }
                }
                if (sortName) {
                    params.sort = sortName + '.' + sortStatus;
                }
            }

            //插件参数合并
            var pluginParams = {};
            for (var i = 0; i < this.opts.plugins.length; i++) {
                var plugin = this.opts.plugins[i];
                $.extend(pluginParams, plugin.params());
            }
            params = $.extend(params, pluginParams);
            //合并load的参数
            params = $.extend(params, args);
            that._showLoading();
            $.ajax({
                type: opts.method,
                url: opts.ajaxUrl,
                data: params,
                dataType: 'JSON',
                cache: opts.cache
            }).done(function (data) {
                try {
                    //获得root对象
                    var items = data;
                    if ($.isArray(data[opts.root])) {
                        items = data[opts.root];
                    }
                    that._populate(items.list);
                    that._hideLoading();
                    if (!opts.remoteSort) {
                        that._refreshSortStatus();
                    }
                    if (data && $.isArray(data[opts.root])) {
                        data = $.extend(args, data);
                    }
                    that.$body.triggerHandler('loadSuccess', data);
                } catch (e) {
                    that._hideLoading();
                    that._showLoadError();
                    throw e;
                }
            }).fail(function (data) {
                that._hideLoading();
                that._showLoadError();
                that.$body.triggerHandler('loadError', data);
            });
        }

        , _loadNative: function (args) {
            this._populate(args.list);
            this._refreshSortStatus();
            this.$body.triggerHandler('loadSuccess', args);
        }
        , load: function (args) {
            try {
                var opts = this.opts;
                this._hideMessage();
                this._loadCount = this._loadCount + 1;

                if ($.isArray(args)) {
                    //加载本地数据
                    this._loadNative(args);
                } else if (opts.ajaxUrl) {
                    //加载远程数据
                    this._loadAjax(args);
                } else if (opts.items) {
                    //加载本地数据
                    this._loadNative(opts.items);
                } else {
                    this._loadNative([]); //否则加载本地空数据
                }
            } catch (e) {
                this._showLoadError();
                throw e;
            }
        }

        //重设尺寸
        , resize: function () {
            var opts = this.opts;
            var $edwGrid = this.$edwGrid;
            var $headWrapper = this.$headWrapper;
            var $bodyWrapper = this.$bodyWrapper;
            var $footWrapper = this.$footWrapper;

            //兼容ie6
            if (browser.isIE6 && (!opts.width || opts.width === 'auto')) {
                $edwGrid.width('100%');
                $edwGrid.width($edwGrid.width() - ($edwGrid.outerWidth(true) - $edwGrid.width()));
            } else {
                $edwGrid.width(opts.width);
            }

            if (opts.height !== 'auto') {
                if (browser.isIE6 && (!opts.height || opts.height === 'auto')) {
                    $edwGrid.height('100%');
                    $edwGrid.height($edwGrid.height() - ($edwGrid.outerHeight(true) - $edwGrid.height()));
                } else {
                    if (this.jianHeight) {
                        $edwGrid.height($(window).height() - this.jianHeight);
                    } else {
                        $edwGrid.height(opts.height);
                    }
                }

                $bodyWrapper.height($edwGrid.height() - $headWrapper.outerHeight(true) - $footWrapper.outerHeight(true));
            }

            //调整message
            var $message = $edwGrid.find('.edw-message');
            if ($message.is(':visible')) {
                $message.css({
                    'left': ($edwGrid.width() - $message.width()) / 2,
                    'top': ($edwGrid.height() + $headWrapper.height() - $message.height()) / 2
                });
            }
            //调整loading
            var $mask = $edwGrid.find('.edw-mask');
            if ($mask.is(':visible')) {
                $mask.width($edwGrid.width()).height($edwGrid.height());
                var $loadingWrapper = $edwGrid.find('.edw-loading');
                $loadingWrapper.css({
                    'left': ($edwGrid.width() - $loadingWrapper.width()) / 2,
                    'top': ($edwGrid.height() - $loadingWrapper.height()) / 2
                })
            }

            $bodyWrapper.trigger('scroll');

            this._resizeHeight();
        }

        //调整高度
        , _resizeHeight: function () {
            var opts = this.opts;
            var $bodyWrapper = this.$bodyWrapper;
            var $body = this.$body;
            if (opts.height === 'auto' && browser.isIE7) {
                $bodyWrapper.height('auto');
                if ($bodyWrapper.width() < $body.width()) {
                    $bodyWrapper.height($bodyWrapper.height() + $bodyWrapper.height() - $bodyWrapper[0].clientHeight + 1);
                }
            }
        }

        //选中
        , select: function (args) {
            var opts = this.opts;
            var $body = this.$body;
            var $head = this.$head;

            if (typeof args === 'number') {
                var $tr = $body.find('tr').eq(args);
                if (!opts.multiSelect) {
                    $body.find('tr.selected').removeClass('selected');
                    if (opts.checkCell) {
                        $body.find('tr > td').find('.edw-check').prop('checked', '');
                    }
                }
                if (!$tr.hasClass('selected')) {
                    $tr.addClass('selected');
                    if (opts.checkCell) {
                        $tr.find('td .edw-check').prop('checked', 'checked');
                    }
                }
            } else if (typeof args === 'function') {
                $.each($body.find('tr'), function (index) {
                    if (args($.data(this, 'item'), index)) {
                        var $this = $(this);
                        if (!$this.hasClass('selected')) {
                            $this.addClass('selected');
                            if (opts.checkCell) {
                                $this.find('td .edw-check').prop('checked', 'checked');
                            }
                        }
                    }
                });
            } else if (args === undefined || (typeof args === 'string' && args === 'all')) {
                $body.find('tr.selected').removeClass('selected');
                $body.find('tr').addClass('selected');
                $body.find('tr > td').find('.edw-check').prop('checked', 'checked');
            } else {
                return;
            }

            if (opts.checkCell) {
                var $checks = $body.find('tr > td').find('.edw-check');
                if ($checks.length === $checks.filter(':checked').length) {
                    $head.find('th .checkAll').prop('checked', 'checked');
                }
            }
        }
        //取消选中
        , deselect: function (args) {
            var opts = this.opts;
            var $body = this.$body;
            var $head = this.$head;
            if (typeof args === 'number') {
                $body.find('tr').eq(args).removeClass('selected');
                if (opts.checkCell) {
                    $body.find('tr').eq(args).find('td .edw-check').prop('checked', '');
                }
            } else if (typeof args === 'function') {
                $.each($body.find('tr'), function (index) {
                    if (args($.data(this, 'item'), index)) {
                        $(this).removeClass('selected');
                        if (opts.checkCell) {
                            $(this).find('td .edw-check').prop('checked', '');
                        }
                    }
                });
            } else if (args === undefined || (typeof args === 'string' && args === 'all')) {
                $body.find('tr.selected').removeClass('selected');
                if (opts.checkCell) {
                    $body.find('tr > td').find('.edw-check').prop('checked', '');
                }
            } else {
                return;
            }
            $head.find('th .checkAll').prop('checked', '');
        }
        //获取选中行
        , selectedRows: function (name) {
            var $body = this.$body;
            var selected = [];
            $.each($body.find('tr.selected'), function (index, item) {
                if (!!name) {
                    selected.push($.data(this, 'item')[name]);
                } else {
                    selected.push($.data(this, 'item'));
                }
            });
            return selected;
        }
        //获取选中行索引
        , selectedRowsIndex: function () {
            var $body = this.$body;
            var $trs = this.$body.find('tr')
            var selected = [];
            $.each($body.find('tr.selected'), function (index) {
                selected.push($trs.index(this));
            });
            return selected;
        }
        //获取全部行数据
        , rows: function (name) {
            var $body = this.$body;
            var items = [];
            $.each($body.find('tr'), function () {
                if (!!name) {
                    items.push($.data(this, 'item')[name]);
                } else {
                    items.push($.data(this, 'item'));
                }
            });
            return items;
        }
        //获取指定行索引数据
        , row: function (index) {
            var $body = this.$body;
            if (index !== undefined && index >= 0) {
                var $tr = $body.find('tr').eq(index);
                if ($tr.length !== 0) {
                    return $.data($tr[0], 'item');
                }
            }
        }
        //获取行数量
        , rowsLength: function () {
            var $body = this.$body;
            var length = $body.find('tr').length;
            if (length === 1 && $body.find('tr.emptyRow').length === 1) {
                return 0;
            }
            return length;
        }
        //添加数据，第一个参数可以为数组
        , addRow: function (item, index) {
            var $tbody = this.$body.find('tbody');

            if ($.isArray(item)) {
                for (var i = item.length - 1; i >= 0; i--) {
                    this.addRow(item[i], index);
                }
                return;
            }

            if (!$.isPlainObject(item)) {
                return;
            }

            this._hideMessage();
            this._removeEmptyRow();

            var $tr;

            if (index === undefined || index < 0) {
                $tr = $(this._rowHtml(item, this.rowsLength()));
                $tbody.append($tr);
            } else {
                $tr = $(this._rowHtml(item, index));
                if (index === 0) {
                    $tbody.prepend($tr);
                } else {
                    var $before = $tbody.find('tr').eq(index - 1);
                    //找不到就插到最后
                    if ($before.length === 0) {
                        $tbody.append($tr);
                    } else {
                        $before.after($($tr));
                    }
                }
            }
            $tr.data('item', item);
            this._setStyle();

            this.$body.triggerHandler('rowInserted', [item, index]);
        }
        //更新行内容，两个参数都必填
        , updateRow: function (item, index) {
            var opts = this.opts;
            var $tbody = this.$body.find('tbody');
            if (!$.isPlainObject(item)) {
                return;
            }
            var oldItem = this.row(index);

            var $tr = $tbody.find('tr').eq(index);
            var checked = $tr.find('td:first :checkbox').is(':checked');
            $tr.html(this._rowHtml(item, index).slice(4, -5));
            if (opts.checkCell) {
                $tr.find('td:first :checkbox').prop('checked', checked);
            }

            $tr.data('item', item);
            this._setStyle();

            this.$body.triggerHandler('rowUpdated', [oldItem, item, index]);
        }

        //删除行，参数可以为索引数组
        , removeRow: function (index) {
            var that = this;
            var $tbody = that.$body.find('tbody');

            if ($.isArray(index)) {
                for (var i = index.length - 1; i >= 0; i--) {
                    that.removeRow(index[i]);
                }
                return;
            }

            if (index === undefined) {
                var $trs = $tbody.find('tr');
                for (var i = $trs.length - 1; i >= 0; i--) {
                    that.removeRow(i);
                }
            } else {
                var item = that.row(index);
                $tbody.find('tr').eq(index).remove();
                this.$body.triggerHandler('rowRemoved', [item, index]);
            }
            this._setStyle();
            if (this.rowsLength() === 0) {
                this._showNoData();
                this._insertEmptyRow();
            }
        }

        //加载分页控件
        , initPaginator: function () {
            var that = this;
            var $footWrapper = this.$footWrapper;
            var regional = {
                strPage: "<span>第</span>{0}<span>页</span><span>/</span><span>共</span> {1} <span>页</span>",
                strFirstPage: "首页",
                strPrevPage: "上一页",
                strNextPage: "下一页",
                strLastPage: "尾页",
                strRefresh: "刷新",
                strPageSize: "每页记录:",
                strDisplay: "检索到 {0} 条记录，显示 第 {1} 条 - 第 {2} 条."
            }
            var pageArgs = {
                pageIndex: 1,
                totalPages: 0,
                totalRecords: 0,
                msg: "",
                pageSizeList: [10, 20, 30, 40, 50, 100],
                pageSize: 40
            }
            this.pageArgs = $.extend(false, {}, regional, pageArgs, that.opts.paginator);
            this.$paginator = $("<div class='edwPaginator'></div>"); //分页对象
            $footWrapper.append(this.$paginator);

            var opts = that.pageArgs;

            //首页
            this.first = $("<input type='button' class='edw-page-first' title='" + this.pageArgs.strFirstPage + "'/>", {}).appendTo(this.$paginator).bind("click", function (evt) {
                if (opts.pageIndex > 1) {
                    opts.pageIndex = 1;
                    pageLoad();
                }
            });
            //上一页
            this.prev = $("<input type='button' class='edw-page-prev' title='" + this.pageArgs.strPrevPage + "'/>").appendTo(this.$paginator).bind("click", function (evt) {
                if (opts.pageIndex > 1) {
                    opts.pageIndex -= 1;
                    pageLoad(); //执行分页加载
                }
            });
            //分隔符
            $("<span class='edw-separator'></span>").appendTo(this.$paginator);
            //分页详细
            this.pagePlaceHolder = $("<span class='edw-pageholder'></span>").appendTo(this.$paginator);
            //分隔符
            $("<span class='edw-separator'></span>").appendTo(this.$paginator);
            //下一页
            this.next = $("<input type='button' class='edw-page-next' title='" + this.pageArgs.strNextPage + "'/>").appendTo(this.$paginator).bind("click", function (evt) {
                if (opts.pageIndex < opts.totalPages) {
                    opts.pageIndex = parseInt(opts.pageIndex);
                    opts.pageIndex += 1;
                    pageLoad(); //执行分页加载
                }
            });
            //尾页
            this.last = $("<input type='button' class='edw-page-last' title='" + this.pageArgs.strLastPage + "'/>").appendTo(this.$paginator).bind("click", function (evt) {
                if (opts.pageIndex < opts.totalPages) {
                    opts.pageIndex = that.pageArgs.totalPages;
                    pageLoad(); //执行分页加载
                }
            });
            //分隔符
            $("<span class='edw-separator'></span>").appendTo(this.$paginator);
            //分页大小提示
            this.$strPageSize = $("<span>" + this.pageArgs.strPageSize + " </span>").appendTo(this.$paginator);
            //分页大小
            this.$pageSize = $("<select></select>").appendTo(this.$paginator).change(function (evt) {
                var oldPageSize = opts.pageSize;
                var oldIndex = opts.pageIndex;
                var newPageSize = $(this).val();
                //var newIndex = (oldPageSize / newPageSize) * oldIndex;
                var newIndex = oldPageSize <= newPageSize ? ((oldPageSize / newPageSize) * oldIndex) : (newPageSize / oldPageSize) * oldIndex;

                opts.pageSize = newPageSize;
                opts.pageIndex = Math.ceil(newIndex);
                pageLoad(); //执行分页加载
            });
            //分隔符
            $("<span class='edw-separator'></span>").appendTo(this.$paginator);
            //刷新
            this.$refresh = $("<input type='button' class='edw-refresh' title='" + this.pageArgs.strRefresh + "'/>").appendTo(this.$paginator).bind("click", function (evt) {
                pageLoad(); //执行分页加载
            });
            //分隔符
            $("<span class='edw-separator'></span>").appendTo(this.$paginator);
            //分页信息
            this.$msg = $("<span class='edw-page-msg'></span>").appendTo(this.$paginator);

            //刷新分页
            var _refreshPage = function () {
                that.pagePlaceHolder.empty();
                var strPage = opts.strPage;

                strPage = strPage.replace("{0}", "<input type='text' tabindex='0' />");
                strPage = strPage.replace("{1}", "<span class='total'></span>");
                var $temp = $(strPage).appendTo(that.pagePlaceHolder);
                that.pagePlaceHolder.find("input[type='text']").bind("change", function (evt) {
                    var $this = $(this);
                    var val = $this.val();
                    if (isNaN(val) || val < 1) {
                        $this.val(that.pageArgs.pageIndex);
                        return false;
                    }
                    val = parseInt(val);
                    if (val > that.pageArgs.totalPages) {
                        $this.val(that.pageArgs.pageIndex);
                        return false;
                    }
                    that.pageArgs.pageIndex = val;
                    pageLoad(); //执行分页加载
                });
            }
            //刷新整个分页元素
            var _refresh = function () {
                //总页数
                that.pageArgs.totalPages = Math.ceil(that.pageArgs.totalRecords / that.pageArgs.pageSize);
                _refreshPage();

                var sel = (that.$pageSize);
                var thisOptions = that.pageArgs;
                sel.empty();
                var opts = thisOptions.pageSizeList;
                for (var i = 0; i < opts.length; i++) {
                    sel.append("<option value=" + opts[i] + ">" + opts[i] + "</option>");
                }
                sel.find("option[value=" + that.pageArgs.pageSize + "]").attr("selected", true);

                if (that.pageArgs.pageIndex >= that.pageArgs.totalPages) {
                    that.next.attr("disabled", true);
                    that.last.attr("disabled", true);
                } else {
                    that.next.removeAttr("disabled");
                    that.last.removeAttr("disabled");
                }
                if (that.pageArgs.pageIndex <= 1) {
                    that.first.attr("disabled", true);
                    that.prev.attr("disabled", true);
                } else {
                    that.first.removeAttr("disabled");
                    that.prev.removeAttr("disabled");
                }

                that.pagePlaceHolder.find("input[type='text']").val(that.pageArgs.pageIndex);
                that.pagePlaceHolder.find(".total").text(that.pageArgs.totalPages);

                if (that.pageArgs.totalRecords > 0) {
                    var pageSize = that.pageArgs.pageSize;
                    var currentPage = that.pageArgs.pageIndex;
                    var totalRecords = that.pageArgs.totalRecords;
                    var begIndx = (currentPage - 1) * pageSize;
                    var endIndx = currentPage * pageSize;
                    if (endIndx > totalRecords) {
                        endIndx = totalRecords;
                    }
                    var strDisplay = that.pageArgs.strDisplay;
                    strDisplay = strDisplay.replace("{0}", totalRecords);
                    strDisplay = strDisplay.replace("{1}", begIndx + 1);
                    strDisplay = strDisplay.replace("{2}", endIndx);
                    that.$msg.html(strDisplay);
                }
                else {
                    that.$msg.html("");
                }
            }
            //分页显示数据
            var pageLoad = function () {
                var params = {};
                //params["edwGridIndex"] = that.pageArgs.pageIndex;
                //params["edwGridSize"] = that.pageArgs.pageSize;
                params["page_index"] = that.pageArgs.pageIndex;
                params["page_size"] = that.pageArgs.pageSize;
                params["token"] =  getCookie("token");

                if (that.opts.id != "") {
                    addCookie(that.opts.id, params["page_index"]);
                }
                that.load(params);
            }
            //数据加载完成
            that.$body.on('loadSuccess', function (e, data) {
                that.pageArgs.totalRecords = data.total;
                _refresh(); //刷新            
            });

            pageLoad();
        }
        //分页加载
        , pageLoad: function (option) {
            var params = {};
            //params["edwGridIndex"] = this.pageArgs.pageIndex;
            //params["edwGridSize"] = this.pageArgs.pageSize;
            params["page_index"] = this.pageArgs.pageIndex;
            params["page_size"] = this.pageArgs.pageSize;
            params["token"] = getCookie("token");
            params = $.extend(true, params, option);
            delete params["ajaxUrl"];
            this.opts.ajaxUrl = option.ajaxUrl;
            this.load(params);
        }
    };

    $.fn.edwGrid = function () {
        if (arguments.length === 0 || typeof arguments[0] === 'object') {
            var option = arguments[0]
                , data = this.data('edwGrid')
                , options = $.extend(true, {}, $.fn.edwGrid.defaults, option);
            if (!data) {
                data = new EdwGrid(this, options);
                this.data('edwGrid', data);
                //} else if (!!option) { //vs提示
            } else if (option) {
                var that = this;
                setTimeout(function () {
                    if (data.opts.ajaxUrl) {
                        that.pageLoad();
                    } else {
                        that.load(data.opts.items);
                    }
                }, 0); //chrome问题  
            }
            return $.extend(true, this, data);
        }
        if (typeof arguments[0] === 'string') {
            //var data = this.data('edwGrid'); //vs提示
            data = this.data('edwGrid');
            var fn = data[arguments[0]];
            if (fn) {
                var args = Array.prototype.slice.call(arguments);
                return fn.apply(data, args.slice(1));
            }
        }
    };

    $.fn.edwGrid.defaults = {
        width: 'auto'
        , height: '280px'
        , colModel: []
        , ajaxUrl: false
        , params: {}
        , method: 'GET'
        , cache: false
        , root: 'data'
        , items: []
        , autoLoad: true
        , remoteSort: false
        , sortName: ''
        , sortStatus: 'asc'
        , loadingText: '加载数据...'
        , noDataText: '系统未检索到数据'
        , loadErrorText: '数据加载异常...'
        , multiSelect: true
        , checkCell: true
        , indexCell: true
        , indexColWidth: 40
        , fullWidthRows: true
        , nowrap: true
        , showBackboard: true
        , backboardMinHeight: 125
        , plugins: [] //插件 插件必须实现 init($edwGrid)和params()方法
    };

    //声明事件
    //event : loadSuccess(e,data), loadError(e, data), cellSelected(e, item, rowIndex, colIndex)
    //rowInserted(e,item, rowIndex), rowUpdated(e, oldItem, newItem, rowIndex), rowRemoved(e,item, rowIndex)

    $.fn.edwGrid.Constructor = EdwGrid;

    //元素排序 参考: http://james.padolsey.com/javascript/sorting-elements-with-jquery/
    $.fn.sortElements = (function () {
        var sort = [].sort;
        return function (comparator, getSortable) {
            getSortable = getSortable || function () { return this; };
            var placements = this.map(function () {
                var sortElement = getSortable.call(this),
                    parentNode = sortElement.parentNode,
                    nextSibling = parentNode.insertBefore(
                        document.createTextNode(''),
                        sortElement.nextSibling
                    );
                return function () {
                    if (parentNode === this) {
                        throw new Error("无法排序这个元素.");
                    }
                    parentNode.insertBefore(this, nextSibling);
                    parentNode.removeChild(nextSibling);
                };
            });
            return sort.call(this, comparator).each(function (i) {
                placements[i].call(getSortable.call(this));
            });
        };
    })();
}(window.jQuery);

/*便捷方法*/

//是否有修改的值
function IsEditdata(id) {
    var isOK = true;
    if (id == undefined || id == "") {
        isOK = false;
        top.dialog.topMsg("很抱歉，您当前未选中任何一行！", 3, 4000);
    } else if (id.split(",").length > 1) {
        isOK = false;
        top.dialog.topMsg("很抱歉，一次只能选择一条记录！", 3, 4000);
    }
    return isOK;
}
//是否有删除的值
function IsDelData(id, msg) {
    if (id == undefined || id == "") {
        top.dialog.topMsg("很抱歉，您当前未选中任何一行！", 3, 4000);
        return false;
    }
    return confirm(!msg ? "您确定要删除吗?" : msg);
}
//是否有选中行
function IsChecked(id) {
    var isOK = true;
    if (id == undefined || id == "") {
        isOK = false;
        top.dialog.topMsg("您当前未选中任何一行！", 3, 4000);
    }
    return isOK;
}
//对象是否为空或空对象
function IsNullOrEmpty(str) {
    var isOK = true;
    if (str == undefined || str == "") {
        isOK = false;
    }
    return isOK;
}
//ajax获取数据记录
function IsExist_Data(url, parm) {
    var num = 0;
    $.getajax(url, parm, function (rs) { num = parseInt(rs); });
    return num;
}