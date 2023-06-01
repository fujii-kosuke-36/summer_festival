module ApplicationHelper
def default_meta_tags
    {
        site: 'Fest-Hunt',
        title: '野外フェスの検索サービス',
        reverse: true,
        charset: 'utf-8',
        description: 'Fest-Huntを使えば、行きたいフェスに合わせてアーティストのおすすめ曲を知ることができます。',
        keywords: '野外フェス,フェス,音楽',
        canonical: request.original_url,
        separator: '|',
        og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), 
        local: 'ja-JP'
        },
        
        twitter: {
        card: 'summary_large_image',
        site: '@', 
        image: image_url('ogp.png')
        }
    }
    end
end
