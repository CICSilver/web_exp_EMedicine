class Navbar extends React.Component{
    render() {
        return (
            <div>
                <div className={"header-top"}>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-6">
                                <div className="header-top-left">
                                    <ul>
                                        <li><i className="glyphicon glyphicon-home"/><a className="nav-href"
                                                                                           href="#">首页</a></li>
                                        <li>我很可爱</li>
                                        <li>请给我钱</li>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-6">
                                <div className="header-top-right">
                                    <ul>
                                        <li><i className="glyphicon glyphicon-shopping-cart"><a href="#"><span
                                            className="nav-href">购物车</span></a></i></li>
                                        <li className="dropdown">
                                            <a className="nav-href" href="#" data-toggle="dropdown"
                                               aria-expanded="true">我的<span className="caret"/></a>
                                            <ul className="dropdown-menu" role="menu">
                                                <li><a className="nav-href" href="#">购物车</a></li>
                                                <li><a className="nav-href" href="#">优惠券</a></li>
                                            </ul>
                                        </li>
                                        <li><a className="nav-href" href="../view/register.jsp">立即注册</a></li>
                                        <li><a className="nav-href" href="../view/login.jsp">登录</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="container">
                    <div className="row">
                        <div className="col-lg-3">
                            <div className="header-logo">
                                <img className="logo" alt="" src={"../images/logo-ts.png"}/>
                            </div>
                        </div>
                        <div className="col-lg-6">
                            <nav className="header-menu">
                                <ul>
                                    <li className="active"><a href="#">首页</a></li>
                                    <li><a href="#">促销分区</a>
                                        <ul className="header-menu-dropdown">
                                            <li><a href="#">滋补调养</a></li>
                                            <li><a href="#">中药专区</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">占位</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div className="col-lg-3"/>
                    </div>
                </div>
            </div>
        );
    }
}

ReactDOM.render(
    <Navbar/>,
    document.getElementById('nav')
);
